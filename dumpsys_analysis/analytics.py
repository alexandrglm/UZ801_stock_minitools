#####################################################
# System Analysis tool v.0.2                       #
# alpha, sketching                                  #
# 2024, Nov. 4rd.                                   #
#####################################################

import os
import re
from datetime import datetime

### ESTO HAY QUE REORGANIZARLO (todas las secciones marcadas; separa defs lo suficiente como para ser limpio, escalable, legible)

def analyze_ipa(ipa_log_path):
    try:
        with open(ipa_log_path, 'r') as f:
            return f.read()
    except FileNotFoundError:
        print(f"ERROR: There's no ip commands available: {ipa_log_path}")
        return ''

def analyze_packagesS(packagesS_log_path):
    try:
        with open(packagesS_log_path, 'r') as f:
            return f.read()
    except FileNotFoundError:
        print(f"ERROR: There's no system apps list available: {packagesS_log_path}")
        return ''

def analyze_packages3(packages3_log_path):
    try:
        with open(packages3_log_path, 'r') as f:
            return f.read()
    except FileNotFoundError:
        print(f"ERROR: There's no user apps list available: {packages3_log_path}")
        return ''

def analyze_getprop(getprop_log_path):
    try:
        with open(getprop_log_path, 'r') as f:
            return f.read()
    except FileNotFoundError:
        print(f"ERROR: There's no getprop available: {getprop_log_path}")
        return ''


def analyze_dmesg(dmesg_log_path):
    try:
        with open(dmesg_log_path, 'r') as f:
            return f.read()
    except FileNotFoundError:
        print(f"ERROR: There's no dmesg logs available: {dmesg_log_path}")
        return ''

def analyze_dumpsys(dumpsys_data):
    data = {}
    services = []
    for line in dumpsys_data.splitlines():
        if line.startswith('DUMP OF SERVICE'):
            service = line.split(' ')[-1]
            services.append(service)
    data['services'] = services

    surfaceflinger = re.search(r'DUMP OF SERVICE SurfaceFlinger:(.*?)(?:DUMP OF SERVICE|$)', dumpsys_data, re.S)
    data['surfaceflinger'] = surfaceflinger.group(1) if surfaceflinger else 'N/A'

    buffers = re.findall(r'Allocated buffers:(.*?)(?:Total allocated \(estimate\):|$)', dumpsys_data, re.S)
    data['allocated_buffers'] = buffers[0] if buffers else 'N/A'

    hw_composer = re.search(r'h/w composer state:(.*?)(?:Qualcomm HWC state:|$)', dumpsys_data, re.S)
    data['hardware_composer'] = hw_composer.group(1) if hw_composer else 'N/A'

    intents = re.search(r'ACTIVITY MANAGER PENDING INTENTS(.*?)(?:ACTIVITY MANAGER BROADCAST STATE|$)', dumpsys_data, re.S)
    data['pending_intents'] = intents.group(1) if intents else 'N/A'

    receivers = re.search(r'ACTIVITY MANAGER BROADCAST STATE(.*?)(?:DUMP OF SERVICE|$)', dumpsys_data, re.S)
    data['registered_receivers'] = receivers.group(1) if receivers else 'N/A'

    processes = []

    for line in dumpsys_data.splitlines():
        if 'Proc' in line and 'pid=' in line:
            process = line.split(':')[1].strip()
            processes.append(process)
    data['processes'] = processes

    match = re.search(r'Total RAM: (\d+) kB', dumpsys_data)
    data['total_memory'] = int(match.group(1)) if match else 'N/A'
    match = re.search(r'Free RAM: (\d+) kB', dumpsys_data)
    data['free_memory'] = int(match.group(1)) if match else 'N/A'

    interfaces = []
    for match in re.finditer(r'iface: ([\w-]+).*?inet addr: ([\d.]+).*?MTU: (\d+)', dumpsys_data, re.DOTALL):
        interfaces.append({
            'name': match.group(1),
            'ip': match.group(2),
            'mtu': match.group(3),
        })
    data['network_interfaces'] = interfaces

    sensors = []
    for line in dumpsys_data.splitlines():
        if 'Sensor ' in line:
            sensor_info = line.split('Sensor ')[1].strip()
            sensors.append(sensor_info)
    data['sensors'] = sensors

    storage = []
    for line in dumpsys_data.splitlines():
        if 'Filesystem' in line and 'Size' in line:
            storage_info = line.strip()
            storage.append(storage_info)
    data['storage'] = storage

    match = re.search(r'level: (\d+)', dumpsys_data)

    data['battery_level'] = int(match.group(1)) if match else 'N/A'
    match = re.search(r'status: (\w+)', dumpsys_data)

    data['battery_status'] = match.group(1) if match else 'N/A'
    match = re.search(r'powered: (\w+)', dumpsys_data)

    data['power_source'] = match.group(1) if match else 'N/A'

    return data


def analyze_proc(proc_log_path):
    proc_data = {}
    current_section = None
    section_content = ''
    try:
        with open(proc_log_path, 'r') as f:
            for line in f:
                line = line.strip()
                if line.startswith('n# /proc/'):
                    if current_section:
                        proc_data[current_section] = section_content.strip()
                    current_section = line
                    section_content = ''
                elif current_section:
                    section_content += line + '\n'
            if current_section:
                proc_data[current_section] = section_content.strip()

    except FileNotFoundError:
        print(f"ERROR: There's no /proc/ log available {proc_log_path}")
        return {}
    return proc_data

### ESTO HAY QUE REORGANIZARLO
def generate_html(data, proc_data, dmesg_data, ipa_data, packagesS_data, packages3_data, getprop_data):

    date = datetime.now().strftime("%Y%m%d_%H%M%S")
    html_path = f"./www/Dumpsys_log_{date}.html"

    cpuinfo = proc_data.get('n# /proc/cpuinfo', '')
    version = proc_data.get('n# /proc/version', '')
    uptime = proc_data.get('n# /proc/uptime', '')
    loadavg = proc_data.get('n# /proc/loadavg', '')
    modules = proc_data.get('n# /proc/modules', '')
    netdev = proc_data.get('n# /proc/net/dev', '')
    partitions = proc_data.get('n# /proc/partitions', '')
    mounts = proc_data.get('n# /proc/mounts', '')
    diskstats = proc_data.get('n# /proc/diskstats', '')
    meminfo = proc_data.get('n# /proc/meminfo', '')
    vmstat = proc_data.get('n# /proc/vmstat', '')
    interrupts = proc_data.get('n# /proc/interrupts', '')

    with open(html_path, "w") as f:
        f.write(f"""
<!DOCTYPE html>
<html lang="eu-es">

<head>
	<meta charset="UTF-8">
	<title>System Analyzer from </title>
	<link rel="stylesheet" href="../css/style.css">
	<script src="../js/persianero.js"></script>
</head>

<body>
	<h1> - System Analyzer from - </h1>

	<section id="system">
		<h2>1. SYSTEM</h2>
		<div class="persiana">
			<h3>1.1 - Chipset specs.</h3>
			<div class="content">
				<pre>{cpuinfo}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>1.2 - Kernel 'uname -a'</h3>
			<div class="content">
				<pre>{version}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>1.3 - Uptime / Average load </h3>
			<div class="content">
				<pre>{uptime} (in seconds) </pre>
				<pre>{loadavg}  </pre>
				<pre>Last minute | Last 5 mins | Last 15 mins | ExecutingProccess/TotalProccess | Last PID created</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>1.4 - Kernel mods. loaded.</h3>
			<div class="content">
				<pre>{modules}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>1.7 - Powering info</h3>
			<div class="content">
				<p>
					Power Source: {data.get('power_source', 'N/A')}<br>
					Battery %: {data.get('battery_level', 'N/A')}%<br>
					Battery Status: {data.get('battery_status', 'N/A')}<br>
				</p>
			</div>
		</div>

		<div class="persiana">
			<h3>1.8 - Sensors </h3>
			<div class="content">
				<ul>
					{''.join([f'<li>{sensor}</li>' for sensor in data.get('sensors', [])])}
				</ul>
			</div>
		</div>

		<div class="persiana">
			<h3>1.9 - DMESG</h3>
			<div class="content">
				<pre>{dmesg_data}</pre>
			</div>
		</div>
	</section>

	<section id="networking">
		<h2>2. NETWORKING</h2>
		<div class="persiana">
			<h3>2.1 - Interfaces / Devices </h3>
			<div class="content">
				<pre>{netdev}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>2.2 - ifconfings / iw / ip a / ip route</h3>
			<div class="content">
				<ul>
					{''.join([f"<li>{iface['name']}: {iface['ip']} (MTU: {iface['mtu']})</li>" for iface in data.get('network_interfaces', [])])}
				</ul>
			</div>
		</div>

		<div class="persiana">
			<h3>2.3 'ip a'</h3>
			<div class="content">
				<pre>{ipa_data}</pre>
			</div>
		</div>
	</section>

	<section id="filesystem">
		<h2>3. STORAGE </h2>
		<div class="persiana">
			<h3>3.2 - Partitions </h3>
			<div class="content">
				<pre>{partitions}</pre>
			</div>
		</div>
		<div class="persiana">
			<h3>3.3 - Mount </h3>
			<div class="content">
				<pre>{mounts}</pre>
			</div>
		</div>
		<div class="persiana">
			<h3>3.4 - Diskstats</h3>
			<div class="content">
				<pre>{diskstats}</pre>
			</div>
		</div>
	</section>

	<section id="memory">
		<h2>4. MEMORY</h2>
		<div class="persiana">
			<h3>4.1 - Memory info </h3>
			<div class="content">
				<pre>{meminfo}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>4.2 - VMstats</h3>
			<div class="content">
				<pre>{vmstat}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>4.3 IRQ Interrupts</h3>
			<div class="content">
				<pre>{interrupts}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>4.4 - Running services 'top'</h3>
			<div class="content">
				<ul>
					{''.join([f'<li>{service}</li>' for service in data['services']])}
				</ul>
			</div>
		</div>

		<div class="persiana">
			<h3>4.5 - SurfaceFlinger's</h3>
			<div class="content">
				<pre>{data.get('surfaceflinger', 'N/A')}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>4.6 - Buffers</h3>
			<div class="content">
				<pre>{data.get('allocated_buffers', 'N/A')}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>4.7 - Hardware Composer</h3>
			<div class="content">
				<pre>{data.get('hardware_composer', 'N/A')}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>4.8 - Pending Intents logged</h3>
			<div class="content">
				<pre>{data.get('pending_intents', 'N/A')}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>4.9 - Registered services</h3>
			<div class="content">
				<pre>{data.get('registered_receivers', 'N/A')}</pre>
			</div>
		</div>
	</section>

	<section id="OS">
		<h2>5. OS</h2>

		<div class="persiana">
			<h3>5.1 - ANDROID </h3>
			<div class="content">
				<pre> PENDING </pre>
			</div>
		</div>

		<div class="persiana">
			<h3>5.2 - List System apps </h3>
			<div class="content">
				<pre>{packagesS_data}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>5.3 - List User apps </h3>
			<div class="content">
				<pre>{packages3_data}</pre>
			</div>
		</div>

		<div class="persiana">
			<h3>5.4 - Getprop unfiltered </h3>
			<div class="content">
				<pre>{getprop_data}</pre>
			</div>
		</div>

</body>

</html>
""")

    print(f"HTML file generated at: {html_path}")

def generate_js():

    js_path = "./js/persianero.js"
    with open(js_path, "w") as f:
        f.write("""document.addEventListener('DOMContentLoaded', (event) => {
  var sections = document.querySelectorAll(".persiana");

  sections.forEach(function(section) {
    var title = section.querySelector("h3");


    title.addEventListener("click", function() {
      title.classList.toggle("active");

      var content = section.querySelector(".content");
      if (content.style.display === "block") {
        content.style.display = "none";
      } else {
        content.style.display = "block";
      }
    });
  });
});
""")

def generate_css():

    css_path = "./css/style.css"
    with open(css_path, "w") as f:
        f.write("""
body {
    font-family: Verdana, Geneva, sans-serif;
    widht: 100%;
    box-sizing: border-box;
    background-color: #3d3d3d;
}

h1 {
    color: #bbb;
    text-align: center;
}

h2 {
    color: #bbb;
    margin-top: 20px;
}

h3 {
    font-style: italic;
    margin-top: 25px;
    cursor: pointer;
    position: relative;
}

ul {
    list-style: none;
    padding: 0;
}

li {
    margin-bottom: 5px;
}

.persiana {
    background-color: #eee;
    color: #444;
    padding: 18px;
    width: 100%;
    border: none;
    ext-align: left;
    outline: none;
    font-size: 15px;
    margin-bottom: 10px;
    box-sizing: border-box;
}

.persiana h3 {
    padding-left: 20px; /* El puto margen para la flechita de los cojones que me ha vuelto loco dos horas */
}

.persiana h3::before {
    content: "▶";
    position: absolute;
    left: 0;
    font-size: 12px;
    transition: transform 0.3s;
}

.persiana.active h3::before {
    transform: rotate(90deg);
    content: "▼";
}

.content {
    padding: 0 18px;
    display: none;
    overflow: hidden;
    background-color: #deff8c;
}
""")

### ESTO HAY QUE REORGANIZARLO
if __name__ == '__main__':
    folders = ["www", "js", "css"]
    for folder in folders:
        if not os.path.exists(folder):
            os.makedirs(folder)

    with open('./dumpsys.log', 'r') as f:
        dumpsys_data = f.read()
    data = analyze_dumpsys(dumpsys_data)
    proc_data = analyze_proc('./proc.log')
    dmesg_data = analyze_dmesg('./dmesg.log')
    ipa_data = analyze_ipa('./ipa.log')
    packagesS_data = analyze_packagesS('./packagesS.log')
    packages3_data = analyze_packages3('./packages3.log')
    getprop_data = analyze_getprop('./getprop.log')


    generate_js()
    generate_css()
    generate_html(data, proc_data, dmesg_data, ipa_data, packagesS_data, packages3_data, getprop_data)

