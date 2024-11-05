#########################################################
# - Device Analysis tool - v.0.4                        #
#                                                       #
# Author: Alexandr Gomez @alexandrglm                   #
#                                                       #
# Nov,5.2024                                            #
#                                                       #
#########################################################

import os
import re
from datetime import datetime

def analyze_systemBins(system_bins_log_path):

    try:
        with open(system_bins_log_path, 'r') as f:
            return f.read()
    except FileNotFoundError:
        print(f"ERROR: No system_bins logs available at {system_bins_log_path}")
        return ''

def analyze_busybox(busybox_log_path):

    try:
        with open(busybox_log_path, 'r') as f:
            return f.read()
    except FileNotFoundError:
        print(f"ERROR: No busybox info at {busybox_log_path}. CHECK busybox!")
        return ''

def analyze_rootFiles(files_log_path):
    try:
        with open(files_log_path, 'r') as f:
            return f.read()
    except FileNotFoundError:
        print(f"ERROR: No / files available, check find/busybox find: {files_log_path}")
        return ''

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
            getprop_data = f.read()

        # ro.build.date
        match = re.search(r'\[ro\.build\.date]: \[(.*?)\]', getprop_data)
        build_date = match.group(1) if match else ''

        # ro.build.fingerprint
        match = re.search(r'\[ro\.build\.fingerprint]: \[(.*?)\]', getprop_data)
        build_fingerprint = match.group(1) if match else ''

        # ro.build.version.release
        match = re.search(r'\[ro\.build\.version\.release]: \[(.*?)\]', getprop_data)
        build_versionRelease = match.group(1) if match else ''

        # sys.usb.config
        match = re.search(r'\[sys\.usb\.config]: \[(.*?)\]', getprop_data)
        build_usb_config = match.group(1) if match else ''

        # sys.usb.state
        match = re.search(r'\[sys\.usb\.state]: \[(.*?)\]', getprop_data)
        build_usb_state = match.group(1) if match else ''

        # ro.serialno
        match = re.search(r'\[ro\.serialno]: \[(.*?)\]', getprop_data)
        serialno = match.group(1) if match else ''

        return getprop_data, build_date, build_fingerprint, build_versionRelease, build_usb_config, build_usb_state, serialno

    except FileNotFoundError:
        print(f"ERROR: There's no getprop available: {getprop_log_path}")
        return '', '', '', '', '', '', ''

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

    service_matches = re.findall(r'DUMP OF SERVICE (.*?):(.*?)(?:DUMP OF SERVICE|$)', dumpsys_data, re.S)

    for match in service_matches:
        service_name = match[0].strip()
        service_data = match[1].strip()

        services.append(service_name)
        data[service_name] = service_data

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

def dumpsallservices(dumpsys_data):
    data = analyze_dumpsys(dumpsys_data)
    html_output = ""
    for service_name in data['services']:
        service_data = data.get(service_name, 'No data available')
        html_output += f"<div class='persiana'><h3>{service_name}</h3><div class='content'><pre>{service_data}</pre></div></div>"
    return html_output

def analyze_proc(proc_log_path):
    proc_data = {}
    current_section = None
    section_content = ''

    try:
        with open(proc_log_path, 'r') as f:
            for line in f:
                line = line.strip()

                if line.startswith("# /proc/"):
                    if current_section:
                        proc_data[current_section] = section_content.strip()

                    current_section = line[2:].strip()
                    section_content = ''
                elif current_section:
                    section_content += line + '\n'

            if current_section:
                proc_data[current_section] = section_content.strip()

    except FileNotFoundError:
        print(f"ERROR: There's no /proc/ log available at {proc_log_path}")
        return {}

    return proc_data

def generate_html(data, proc_data, dmesg_data, ipa_data, packagesS_data, packages3_data, getprop_data, build_date, build_fingerprint, build_versionRelease, build_usb_config, build_usb_state, serialno, files_data, systemBins_data, busybox_data):
    date = datetime.now().strftime("%Y%m%d_%H%M%S")
    html_path = f"./www/Analysis_{input_devinfo}-{serialno}-{date}.html"

    # Mandatory specifying here every /proc/line ... needs to be moved to procs in order to clarify
    cpuinfo = proc_data.get('/proc/cpuinfo', '')
    version = proc_data.get('/proc/version', '')
    uptime = proc_data.get('/proc/uptime', '')
    loadavg = proc_data.get('/proc/loadavg', '')
    modules = proc_data.get('/proc/modules', '')
    netdev = proc_data.get('/proc/net/dev', '')
    partitions = proc_data.get('/proc/partitions', '')
    mounts = proc_data.get('/proc/mounts', '')
    diskstats = proc_data.get('/proc/diskstats', '')
    meminfo = proc_data.get('/proc/meminfo', '')
    vmstat = proc_data.get('/proc/vmstat', '')
    interrupts = proc_data.get('/proc/interrupts', '')

    with open(html_path, "w") as f:
        f.write(f"""
<!DOCTYPE html>
<html lang="eu-es">
<head>
    <meta charset="UTF-8">
    <title>Analysis: {input_devinfo} - {serialno} - {date}</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/persianero.js"></script>
</head>

<body>
    <h1>{input_devinfo}</h1><hr>
    <h2>Fingerprint: {build_fingerprint}</h2>
    <h2>Build: {build_date}</h2>
    <h2>Device S/N: {serialno}</h2>
    <hr><br>
    <section id="system">
        <h2> - 1: System - </h2>

        <div class="container">
            <div class="persiana">
                <h3>1.1 - Chipset specs.</h3>
                <div class="content">
                    <pre>{cpuinfo}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>1.2 - Kernel 'uname -a'</h3>
                <div class="content">
                    <pre>{version}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>1.3 - Uptime / Average load</h3>
                <div class="content">
                    <pre>{uptime} (in seconds)</pre>
                    <pre>{loadavg}</pre>
                    <pre>Last minute | Last 5 mins | Last 15 mins | ExecutingProccess/TotalProccess | Last PID created</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>1.4 - Kernel mods. loaded.</h3>
                <div class="content">
                    <pre>{modules}</pre>
                </div>
            </div>
        </div>

        <div class="container">
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
        </div>

        <div class="container">
            <div class="persiana">
                <h3>1.8 - Sensors</h3>
                <div class="content">
                    <ul>
                        {''.join([f'<li>{sensor}</li>' for sensor in data.get('sensors', [])])}
                    </ul>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>1.9 - USB</h3>
                <div class="content">
                    <pre>USB available modes: {build_usb_config}</pre>
                    <pre>USB active modes: {build_usb_state}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>1.10 - DMESG</h3>
                <div class="content">
                    <pre>{dmesg_data}</pre>
                </div>
            </div>
        </div>

    </section>

    <section id="networking">
        <h2> - 2: Network - </h2>

        <div class="container">
            <div class="persiana">
                <h3>2.1 - Interfaces / Devices</h3>
                <div class="content">
                    <pre>{netdev}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>2.2 - ifconfig / iw / ip a / ip route</h3>
                <div class="content">
                    <ul>
                        {''.join([f"<li>{iface['name']}: {iface['ip']} (MTU: {iface['mtu']})</li>" for iface in data.get('network_interfaces', [])])}
                    </ul>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>2.3 'ip a'</h3>
                <div class="content">
                    <pre>{ipa_data}</pre>
                </div>
            </div>
        </div>
    </section>

    <section id="filesystem">
        <h2> - 3: Storage - </h2>

        <div class="container">
            <div class="persiana">
                <h3>3.2 - Partitions</h3>
                <div class="content">
                    <pre>{partitions}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>3.3 - Mount</h3>
                <div class="content">
                    <pre>{mounts}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>3.4 - Diskstats</h3>
                <div class="content">
                    <pre>{diskstats}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>3.5 - / paths</h3>
                <div class="content">
                    <pre>{files_data}</pre>
                </div>
            </div>
        </div>

    </section>

    <section id="memory">
        <h2> - 4: Memory - </h2>

        <div class="container">
            <div class="persiana">
                <h3>4.1 - Memory info</h3>
                <div class="content">
                    <pre>{meminfo}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>4.2 - VMstats</h3>
                <div class="content">
                    <pre>{vmstat}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>4.3 - IRQ Interrupts</h3>
                <div class="content">
                    <pre>{interrupts}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>4.4 - Running services 'top'</h3>
                <div class="content">
                    <ul>
                        {''.join([f'<li>{service}</li>' for service in data['services']])}
                    </ul>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>4.5 - SurfaceFlinger's</h3>
                <div class="content">
                    <pre>{data.get('surfaceflinger', 'N/A')}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>4.6 - Buffers</h3>
                <div class="content">
                    <pre>{data.get('allocated_buffers', 'N/A')}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>4.7 - Hardware Composer</h3>
                <div class="content">
                    <pre>{data.get('hardware_composer', 'N/A')}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>4.8 - Pending Intents logged</h3>
                <div class="content">
                    <pre>{data.get('pending_intents', 'N/A')}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>4.9 - Registered services</h3>
                <div class="content">
                    <pre>{data.get('registered_receivers', 'N/A')}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>4.10 - DUMP OF SERVICE</h3>
                <div class="content">
                    {dumpsallservices(dumpsys_data)}
                </div>
            </div>
        </div>
    </section>

    <section id="OS">
        <h2> - 5: OS - </h2>

        <div class="container">
            <div class="persiana">
                <h3>5.1 - ANDROID</h3>
                <div class="content">
                    <pre> Android {build_versionRelease} </pre>
                    <pre> Fingerprint: {build_fingerprint} </pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>5.2 - SYSTEM apps</h3>
                <div class="content">
                    <pre>{packagesS_data}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>5.3 - USER apps</h3>
                <div class="content">
                    <pre>{packages3_data}</pre>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="persiana">
                <h3>5.4 - Getprop unfiltered</h3>
                <div class="content">
                    <pre>{getprop_data}</pre>
                </div>
            </div>
        </div>

    </section>

    <section id="shell">
        <h2> - 6: Shell - </h2>

        <div class="container">
            <div class="persiana">
                <h3>6.1 - SYSTEM bins: </h3>
                <div class="content">
                    <pre>{systemBins_data}</pre>
                </div>

        <div class="container">
            <div class="persiana">
                <h3> 6.1.2 - BUSYBOX functions/binaries:</h4>
                <div class="content">
                    <pre>{busybox_data}</pre>
                </div>
            </div>
        </div>
</body>
</html>
""")

def generate_js():
    js_path = "./js/persianero.js"
    with open(js_path, "w") as f:
        f.write("""
document.addEventListener('DOMContentLoaded', (event) => {
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
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif
    /* width: 100%; */
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
.container {
    padding: 20px;
}
.persiana {
    background-color: #eee;
    color: #444;
    padding: 18px;
    width: 100%;
    border: none;
    /* text-align: left; */
    outline: none;
    font-size: 15px;
    margin-bottom: 10px;
    box-sizing: border-box;
    box-shadow: -18px 15px 26px 5px rgba(15,15,15,0.5);
    /* -webkit-box-shadow: -18px 15px 26px 5px rgba(49,49,49,0.9); */
    /* -moz-box-shadow: -18px 15px 26px 5px rgba(49, 49, 49, 0.9); */
    border-radius: 5px;
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
.persiana.active h3::before { // does not work on latest webkit, idk why
    transform: rotate(90deg);
    content: "▼";
    position: absolute;
    left: 0;
    font-size: 12px;
    transition: transform 0.3s;
}
.content {
    padding: 0 18px;
    display: none;
    overflow: hidden;
    background-color: #deff8c;
}
""")
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
    getprop_data, build_date, build_fingerprint, build_versionRelease, build_usb_config, build_usb_state, serialno = analyze_getprop('./getprop.log')
    files_data = analyze_rootFiles('./files.log')
    systemBins_data = analyze_systemBins('./system_bins.log')
    busybox_data = analyze_busybox('./busybox.log')

    input_devinfo = input("Device Brand - Model ? : ")

    generate_js()
    generate_css()
    generate_html(data, proc_data, dmesg_data, ipa_data, packagesS_data, packages3_data, getprop_data, build_date, build_fingerprint, build_versionRelease, build_usb_config, build_usb_state, serialno, files_data, systemBins_data, busybox_data)
