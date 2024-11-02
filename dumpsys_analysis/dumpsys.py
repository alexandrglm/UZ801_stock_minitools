#####################################################
# Dumpsys analysis tool v.0.1                       #
#                                                   #
#####################################################

import os
import re
from datetime import datetime

# Definitions for the functions
def analyze_dumpsys(dumpsys_data):
    """DUMPSYS ANALYSIS"""

    data = {}

# PM/AM
    services = []
    for line in dumpsys_data.splitlines():
        if line.startswith('DUMP OF SERVICE'):
            service = line.split(' ')[-1]
            services.append(service)
    data['services'] = services

# BAT
    match = re.search(r'level: (\d+)', dumpsys_data)
    data['battery_level'] = int(match.group(1)) if match else 'N/A'
    match = re.search(r'status: (\w+)', dumpsys_data)
    data['battery_status'] = match.group(1) if match else 'N/A'
    match = re.search(r'powered: (\w+)', dumpsys_data)
    data['power_source'] = match.group(1) if match else 'N/A'

# PS
    processes = []
    for line in dumpsys_data.splitlines():
        if 'Proc' in line and 'pid=' in line:
            process = line.split(':')[1].strip()
            processes.append(process)
    data['processes'] = processes

# MEM
    match = re.search(r'Total RAM: (\d+) kB', dumpsys_data)
    data['total_memory'] = int(match.group(1)) if match else 'N/A'
    match = re.search(r'Free RAM: (\d+) kB', dumpsys_data)
    data['free_memory'] = int(match.group(1)) if match else 'N/A'

# NET IFACES
    interfaces = []
    for match in re.finditer(r'iface: ([\w-]+).*?inet addr: ([\d.]+).*?MTU: (\d+)', dumpsys_data, re.DOTALL):
        interfaces.append({
            'name': match.group(1),
            'ip': match.group(2),
            'mtu': match.group(3),
        })
    data['network_interfaces'] = interfaces

# SENSORS
    sensors = []
    for line in dumpsys_data.splitlines():
        if 'Sensor ' in line:
            sensor_info = line.split('Sensor ')[1].strip()
            sensors.append(sensor_info)
    data['sensors'] = sensors

 # FS
    storage = []
    for line in dumpsys_data.splitlines():
        if 'Filesystem' in line and 'Size' in line:
            storage_info = line.strip()
            storage.append(storage_info)
    data['storage'] = storage

 # Scalable: More params. 
    # param1 = []
    # param2 = [] ...

    return data

def generate_html(data):
    """Generating the HTML"""
    date = datetime.now().strftime("%Y%m%d_%H%M%S")
    html_path = f"./www/Dumpsys_log_{date}.html"

    with open(html_path, "w") as f:
        f.write(f"""
<!DOCTYPE html>
<html lang="eu-es">

<head>
    <meta charser="UTF-8">
    <title>Dumpsys Analyzer</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
    <h1>Dumpsys info:</h1>

    <h2>Running Services:</h2>
    <ul>
        {''.join([f'<li>{service}</li>' for service in data['services']])}
    </ul>

    <h2>Battery info:</h2>
    <p>
        Device has no battery, but we want to analyse every dumpsys line
    </p>
    <p>
        Battery %: {data.get('battery_level', 'N/A')}%<br>
        Battery Status: {data.get('battery_status', 'N/A')}<br>
        Power Source: {data.get('power_source', 'N/A')}<br>
    </p>

    <h2>TOP:</h2>
    <ul>
        {''.join([f'<li>{process}</li>' for process in data.get('processes', [])])}
    </ul>

    <h2>About RAM:</h2>
    <p>
        Total Memory: {data.get('total_memory', 'N/A')} kB<br>
        Free Memory: {data.get('free_memory', 'N/A')} kB<br>
    </p>

    <h2>Network interfaces:</h2>
    <ul>
        {''.join([f"<li>{iface['name']}: {iface['ip']} (MTU: {iface['mtu']})</li>" for iface in data.get('network_interfaces', [])])}
    </ul>

    <h2>Sensors availability, or not:</h2>
    <ul>
        {''.join([f'<li>{sensor}</li>' for sensor in data.get('sensors', [])])}
    </ul>

    <h2>Filesystems:</h2>
    <ul>
        {''.join([f'<li>{storage}</li>' for storage in data.get('storage', [])])}
    </ul>

    </body>
</html>
""")

    print(f"HTML data analysis created at {html_path}")

def generate_css():
    """Creating its CSS..."""

    css_path = "./css/style.css"
    with open(css_path, "w") as f:
        f.write("""
body {
    font-family: Verdana, Geneva, sans-serif;
}
h1 {
    text-align: center;
}
h2 {
    margin-top: 20px;
}
ul {
    list-style: none;
    padding: 0;
}
li {
    margin-bottom: 5px;
}
""")

## staring the loop
# generating files
if __name__ == '__main__':
# 1st folders
    folders = ["www", "js", "css"]
    for folder in folders:
        if not os.path.exists(folder):
            os.makedirs(folder)
# the CSS            
    generate_css()

# working with the dumpsys
    with open('./dumpsys.txt', 'r') as f:
        dumpsys_data = f.read()
    data = analyze_dumpsys(dumpsys_data)

# html ext
    generate_html(data)
