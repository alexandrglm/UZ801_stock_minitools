#########################################################
# - Device Analysis tool - v.0.4                        #
#                                                       #
# Author: Alexandr Gomez @alexandrglm                   #
#                                                       #
# Dec. 12. 2024                                         #
#                                                       #
#########################################################

# Pending: New gettingData methods simplified by using "adb X | grep Y"


import os
import re
from datetime import datetime

def readLogFile(filePath):
    try:
        with open(filePath, 'r') as f:
            return f.read()
    except FileNotFoundError:
        print(f"ERROR: Log file not found: {filePath}")
        return ''

def analyzeProc(procLogPath):
    procData = {}
    currentSection = None
    sectionContent = ''

    try:
        with open(procLogPath, 'r') as f:
            for line in f:
                line = line.strip()
                if line.startswith("# /proc/"):
                    if currentSection:
                        procData[currentSection] = sectionContent.strip()
                    currentSection = line[2:].strip()
                    sectionContent = ''
                elif currentSection:
                    sectionContent += line + '\n'

            if currentSection:
                procData[currentSection] = sectionContent.strip()

    except FileNotFoundError:
        print(f"ERROR: /proc log file not found at {procLogPath}")
    return procData

def analyzeDumpSys(dumpSysData):
    if not dumpSysData:
        print("ERROR: dumpSysData is empty. Cannot analyze.")
        return {}
    data = {'services': []}
    service_matches = re.findall(r'DUMP OF SERVICE (.*?):(.*?)(?:DUMP OF SERVICE|$)', dumpSysData, re.S)
    for serviceName, service_content in service_matches:
        data['services'].append(serviceName.strip())
        data[serviceName.strip()] = service_content.strip()
    return data

def dumpsallservices(dumpSysData):
    data = analyzeDumpSys(dumpSysData)
    htmlOutput = ""
    for serviceName in data['services']:
        serviceData = data.get(serviceName, 'No data available')
        htmlOutput += f"<div class='persiana'><h3>{serviceName}</h3><div class='content'><pre>{serviceData}</pre></div></div>"
    return htmlOutput

def getSystemBins(packagesSLogPath):
    try:
        with open(packagesSLogPath, 'r') as f:
            return f.read()
    except FileNotFoundError:
        print(f"ERROR: packagesS log file not found at {packagesSLogPath}")
        return ''

def getUserBins(packages3LogPath):
    try:
        with open(packages3LogPath, 'r') as f:
            return f.read()
    except FileNotFoundError:
        print(f"ERROR: packages3.log file not found at {packages3LogPath}")
        return ''

def generateHTML(dumpSysData, procData, dmesgData, ipAData, getSystemBins, getUserBins, getpropData, busybox_data):
    date = datetime.now().strftime("%Y%m%d_%H%M%S")

    match = re.search(r'\[ro\.serialNo]: \[(.*?)\]', getpropData)
    serialNo = match.group(1) if match else 'unknown'

    inputDeviceInfo = input("Device Brand - Model? : ")
    html_path = f"./www/Analysis_{inputDeviceInfo}-{serialNo}-{date}.html"

    buildDate = re.search(r'\[ro\.build\.date]: \[(.*?)\]', getpropData)
    buildFingerprint = re.search(r'\[ro\.build\.fingerprint]: \[(.*?)\]', getpropData)
    buildVersionRelease = re.search(r'\[ro\.build\.version\.release]: \[(.*?)\]', getpropData)
    buildUSBConfig = re.search(r'\[sys\.usb\.config]: \[(.*?)\]', getpropData)
    buildUSBStatus = re.search(r'\[sys\.usb\.state]: \[(.*?)\]', getpropData)

    cpuinfo = procData.get('/proc/cpuinfo', 'N/A')
    version = procData.get('/proc/version', 'N/A')
    uptime = procData.get('/proc/uptime', 'N/A')
    loadavg = procData.get('/proc/loadavg', 'N/A')
    modules = procData.get('/proc/modules', 'N/A')
    netdev = procData.get('/proc/net/dev', 'N/A')
    partitions = procData.get('/proc/partitions', 'N/A')
    mounts = procData.get('/proc/mounts', 'N/A')
    diskstats = procData.get('/proc/diskstats', 'N/A')
    meminfo = procData.get('/proc/meminfo', 'N/A')
    vmstat = procData.get('/proc/vmstat', 'N/A')
    interrupts = procData.get('/proc/interrupts', 'N/A')

    with open(html_path, "w") as f:
        f.write(f"""
<!DOCTYPE html>
<html>
  <head>
    <title>Analysis: {inputDeviceInfo} - {serialNo} - {date}</title>
    <link rel="stylesheet" href="../css/styles.css">
    <script defer src="../js/script.js"></script>
  </head>
  <body>
    <h1>{inputDeviceInfo}</h1>
    <hr>
    <h2>Fingerprint: {buildFingerprint}</h2>
    <h2>Build: {buildDate}</h2>
    <h2>Device S/N: {serialNo}</h2>
    <hr>

    <section id="system">
      <h2> - 1: System - </h2>

      <div class="container">
        <div class="persiana">
          <h3>1.1 - Chipset specs.</h3>
          <ul>1.1 - Chipset specs.</ul>
          <div class="content">
            <pre>{cpuinfo}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>1.2 - Kernel 'uname -a'</h3>
          <ul>1.2 - Kernel 'uname -a'</ul>
          <div class="content">
            <pre>{version}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>1.3 - Uptime / Average load</h3>
          <ul>1.3 - Uptime / Average load</ul>
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
          <ul>1.4 - Kernel mods. loaded.</ul>
          <div class="content">
            <pre>{modules}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>1.7 - Powering info</h3>
          <ul>1.7 - Powering info</ul>
          <div class="content">
            <p>
              Power Source: PENDING (FROM *.log, that log will be given by " x | grep -i y"<br>
              Battery %: PENDING (FROM *.log, that log will be given by " x | grep -i y"<br>
              Battery Status: PENDING (FROM *.log, that log will be given by " x | grep -i y"<br>
            </p>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>1.8 - Sensors</h3>
          <ul>1.8 - Sensors</ul>
          <div class="content">
            <ul>
              <pre>PENDING (FROM *.log, that log will be given by " x | grep -i y"<br></pre>
            </ul>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>1.9 - USB</h3>
          <ul>1.9 - USB</ul>
          <div class="content">
            <pre>USB available modes: {buildUSBConfig}</pre>
            <pre>USB active modes: {buildUSBStatus}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>1.10 - DMESG</h3>
          <ul>1.10 - DMESG</ul>
          <div class="content">
            <pre>{dmesgData}</pre>
          </div>
        </div>
      </div>
    </section>

    <section id="networking">
      <h2> - 2: Network - </h2>

      <div class="container">
        <div class="persiana">
          <h3>2.1 - Interfaces / Devices</h3>
          <ul>2.1 - Interfaces / Devices</ul>
          <div class="content">
            <pre>{netdev}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>2.2 - ifconfig / iw / ip a / ip route</h3>
          <ul>2.2 - ifconfig / iw / ip a / ip route</ul>
          <div class="content">
            <ul>
               <pre>PENDING (FROM *.log, that log will be given by " x | grep -i y"<br></pre>
            </ul>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>2.3 'ip a'</h3>
          <ul>2.3 'ip a'</ul>
          <div class="content">
            <pre>{ipAData}</pre>
          </div>
        </div>
      </div>
    </section>

    <section id="filesystem">
      <h2> - 3: Storage - </h2>

      <div class="container">
        <div class="persiana">
          <h3>3.2 - Partitions</h3>
          <ul>3.2 - Partitions</ul>
          <div class="content">
            <pre>{partitions}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>3.3 - Mount</h3>
          <ul>3.3 - Mount</ul>
          <div class="content">
            <pre>{mounts}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>3.4 - Diskstats</h3>
          <ul>3.4 - Diskstats</ul>
          <div class="content">
            <pre>{diskstats}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>3.5 - / paths</h3>
          <ul>3.5 - / paths</ul>
          <div class="content">
            <pre>pending</pre>
          </div>
        </div>
      </div>
    </section>

    <section id="memory">
      <h2> - 4: Memory - </h2>

      <div class="container">
        <div class="persiana">
          <h3>4.1 - Memory info</h3>
          <ul>4.1 - Memory info</ul>
          <div class="content">
            <pre>{meminfo}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>4.2 - VMstats</h3>
          <ul>4.2 - VMstats</ul>
          <div class="content">
            <pre>{vmstat}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>4.3 - IRQ Interrupts</h3>
          <ul>4.3 - IRQ Interrupts</ul>
          <div class="content">
            <pre>{interrupts}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>4.4 - Running services 'top'</h3>
          <ul>4.4 - Running services 'top'</ul>
          <div class="content">
            <ul>
              <pre>PENDING (FROM *.log, that log will be given by " x | grep -i y"<br></pre>
            </ul>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>4.5 - SurfaceFlinger's</h3>
          <ul>4.5 - SurfaceFlinger's</ul>
          <div class="content">
              <pre>PENDING (FROM *.log, that log will be given by " x | grep -i y"<br></pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>4.6 - Buffers</h3>
          <ul>4.6 - Buffers</ul>
          <div class="content">
              <pre>PENDING (FROM *.log, that log will be given by " x | grep -i y"<br></pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>4.7 - Hardware Composer</h3>
          <ul>4.7 - Hardware Composer</ul>
          <div class="content">
              <pre>PENDING (FROM *.log, that log will be given by " x | grep -i y"<br></pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>4.8 - Pending Intents logged</h3>
          <ul>4.8 - Pending Intents logged</ul>
          <div class="content">
              <pre>PENDING (FROM *.log, that log will be given by " x | grep -i y"<br></pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>4.9 - Registered services</h3>
          <ul>4.9 - Registered services</ul>
          <div class="content">
              <pre>PENDING (FROM *.log, that log will be given by " x | grep -i y"<br></pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>4.10 - DUMP OF SERVICE</h3>
          <ul>4.10 - DUMP OF SERVICE</ul>
          <div class="content">
            {dumpsallservices(dumpSysData)} 
          </div>
        </div>
      </div>
    </section>

    <section id="OS">
      <h2> - 5: OS - </h2>

      <div class="container">
        <div class="persiana">
          <h3>5.1 - ANDROID</h3>
          <ul>5.1 - ANDROID</ul>
          <div class="content">
            <pre> Android {buildVersionRelease} </pre>
            <pre> Fingerprint: {buildFingerprint} </pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>5.2 - SYSTEM apps</h3>
          <ul>5.2 - SYSTEM apps</ul>
          <div class="content">
            <pre>{getSystemBins}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>5.3 - USER apps</h3>
          <ul>5.3 - USER apps</ul>
          <div class="content">
            <pre>{getUserBins}</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>5.4 - Getprop unfiltered</h3>
          <ul>5.4 - Getprop unfiltered</ul>
          <div class="content">
            <pre>{getpropData}</pre>
          </div>
        </div>
      </div>
    </section>

    <section id="shell">
      <h2> - 6: Shell - </h2>

      <div class="container">
        <div class="persiana">
          <h3>6.1 - SYSTEM bins:</h3>
          <ul>6.1 - SYSTEM bins:</ul>
          <div class="content">
            <pre>pending (from packagesS</pre>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="persiana">
          <h3>6.2 - SDCARD bins:</h3>
          <ul>6.2 - SDCARD bins:</ul>
          <div class="content">
            <pre>pending (from packages3)</pre>
          </div>
        </div>
      </div>
    </section>
    <hr>
    <h4>END OF THE REPORT.</h4>
  </body>
</html>
""")

def generateCSS():
    cssPath = "./css/styles.css"
    with open(cssPath, "w") as f:
        f.write("""
body { font-size: 1rem; font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif; box-sizing: border-box; background-color: #3d3d3d; color: #bbb; } 
h1, h2 { color: #bbb; } 
h1 { text-align: center; } 
h2 { margin-top: 0.5em; } 
h3 { font-style: italic; margin: 25px 0 0 0; cursor: pointer; position: relative; } 
ul { list-style: none; padding: 0; } 
li { margin: 0 0 5px 0; } 
.container { padding: 20px; } 
.persiana { background-color: #eee; color: #444; padding: 18px; width: 100%; border: none; outline: none; font-size: 15px; margin-bottom: 10px; box-sizing: border-box; box-shadow: -18px 15px 26px 5px rgba(15, 15, 15, 0.5); border-radius: 5px; cursor: pointer; } 
.persiana ul { padding-left: 20px; } 
.persiana ul::before { content: '→'; position: absolute; left: 0; font-size: 12px; transition: transform 0.3s; } 
.persiana.active ul::before { content: '↓'; transform: rotate(90deg); position: absolute; left: 0; font-size: 12px; transition: transform 0.3s; } 
.content { padding: 0 18px; display: none; overflow: hidden; background-color: #deff8c; }
""")

def generateJS():
    jsPath = "./js/script.js"
    with open(jsPath, "w") as f:
        f.write("""
document.addEventListener('DOMContentLoaded', (event) => {
    var persianas = document.querySelectorAll(".persiana");

    persianas.forEach(persiana => {
        persiana.addEventListener('click', () => {
        persiana.classList.toggle('active');
        var content = persiana.querySelector('.content');
        if (content.style.display === "block") {
            content.style.display = "none";
        } else {
            content.style.display = "block";
        }
        });
    });
});
""")


if __name__ == '__main__':
    folders = ["www", "js", "css"]
    for folder in folders:
        if not os.path.exists(folder):
            os.makedirs(folder)

    dumpSysData = readLogFile('./dumpsys.log')
    procData = analyzeProc('./proc.log')
    dmesgData = readLogFile('./dmesg.log')
    ipAData = readLogFile('./ipa.log')
    getSystemBins = readLogFile('./packagesS.log')
    getUserBins = readLogFile('./packages3.log')
    getpropData = readLogFile('./getprop.log')
    busybox_data = readLogFile('./busybox.log')

    generateJS()
    generateCSS()
    generateHTML(dumpSysData, procData, dmesgData, ipAData, getSystemBins, getUserBins, getpropData, busybox_data)
    
