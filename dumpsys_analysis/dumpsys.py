#####################################################
# Dumpsys analysis tool v.0.1                       #
# alpha, sketching                                  #
# 2024, Nov. 3rd.                                   #
#####################################################

import os
import re
from datetime import datetime

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
    
    # SurfaceFlingers
    surfaceflinger = re.search(r'DUMP OF SERVICE SurfaceFlinger:(.*?)(?:DUMP OF SERVICE|$)', dumpsys_data, re.S)
    data['surfaceflinger'] = surfaceflinger.group(1) if surfaceflinger else 'N/A'

    # Buffers
    buffers = re.findall(r'Allocated buffers:(.*?)(?:Total allocated \(estimate\):.*?\n|$)', dumpsys_data, re.S)
    data['allocated_buffers'] = buffers[0] if buffers else 'N/A'

    # hw_composer lines
    hw_composer = re.search(r'h/w composer state:(.*?)(?:Qualcomm HWC state:|$)', dumpsys_data, re.S)
    data['hardware_composer'] = hw_composer.group(1) if hw_composer else 'N/A'

    # Intents
    intents = re.search(r'ACTIVITY MANAGER PENDING INTENTS(.*?)(?:ACTIVITY MANAGER BROADCAST STATE|$)', dumpsys_data, re.S)
    data['pending_intents'] = intents.group(1) if intents else 'N/A'

    # and receivers
    receivers = re.search(r'ACTIVITY MANAGER BROADCAST STATE(.*?)(?:DUMP OF SERVICE|$)', dumpsys_data, re.S)
    data['registered_receivers'] = receivers.group(1) if receivers else 'N/A'

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
    
    # BAT
    match = re.search(r'level: (\d+)', dumpsys_data)
    data['battery_level'] = int(match.group(1)) if match else 'N/A'
    match = re.search(r'status: (\w+)', dumpsys_data)
    data['battery_status'] = match.group(1) if match else 'N/A'
    match = re.search(r'powered: (\w+)', dumpsys_data)
    data['power_source'] = match.group(1) if match else 'N/A'

    return data

def generate_html(data):
    """Generating HTML"""

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

    <h2>Battery info:</h2>
    <p>
        Battery %: {data.get('battery_level', 'N/A')}%<br>
        Battery Status: {data.get('battery_status', 'N/A')}<br>
        Power Source: {data.get('power_source', 'N/A')}<br>
    </p>

    <h2>Network interfaces:</h2>
    <ul>
        {''.join([f"<li>{iface['name']}: {iface['ip']} (MTU: {iface['mtu']})</li>" for iface in data.get('network_interfaces', [])])}
    </ul>


    <h2>TOP:</h2>
    <ul>
        {''.join([f'<li>{process}</li>' for process in data.get('processes', [])])}
    </ul>

    <h2>About RAM:</h2>
    <p>
        Total Memory: {data.get('total_memory', 'N/A')} kB<br>
        Free Memory: {data.get('free_memory', 'N/A')} kB<br>
    </p>

    <h2>Running Services:</h2>
    <ul>
        {''.join([f'<li>{service}</li>' for service in data['services']])}
    </ul>

    <h3> - SurfaceFlingers - </h3>
    <pre>{data.get('surfaceflinger', 'N/A')}</pre>

    <h3> - Buffers - </h3>
    <pre>{data.get('allocated_buffers', 'N/A')}</pre>

    <h3> - Hardware composer -</h3>
    <pre>{data.get('hardware_composer', 'N/A')}</pre>

    <h3> - Pending intents - </h3>
    <pre>{data.get('pending_intents', 'N/A')}</pre>

    <h3> - Registered receivers - </h3>
    <pre>{data.get('registered_receivers', 'N/A')}</pre>

    </body>
</html>
""")

    print(f"HTML file generated at: {html_path}")

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

h3 {
    font-style: italic;
    margin-top: 25px;
}
ul {
    list-style: none;
    padding: 0;
}

li {
    margin-bottom: 5px;
}
""")

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
