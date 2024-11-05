#########################################################
# - ADB shell parser webGUI v.0.1                       #
#                                                       #
# Author: Alexandr Gomez @alexandrglm                   #
#                                                       #
# Nov,5.2024                                            #
#########################################################
#
## Comments:
# The main idea is using a functional shell on a self-contained html 
# parsing an input to adb shell "" commands
# with mainly shell functions like:
# - Commands history 
# - Input/returs auto-scroll
# - TAB helping with no browser conflicts
# - 'cd' memorized paths
#
# Simple python server config, needs to be updated to a jetty2 srv, included in dongle' firmware.
#
## py dependences:
# pip install Flask / apt install python3-flask
#
#
## PENDING: 
# path logic improvements

import subprocess
import webbrowser
from flask import Flask, request, jsonify, render_template_string
from threading import Timer

app = Flask(__name__)
current_path = "/"
webShell = """
<!DOCTYPE html>
<html>
<head>
  <title>ADB shell parser v.0.1</title>
  <style>
    body { background-color: #444; color: #eee; font-family: monospace; display: flex; flex-direction: column; height: 100vh; margin: 0; }
    #output-container { flex-grow: 1; overflow-y: auto; padding: 10px; border: 1px solid #555; }
    #output { white-space: pre-wrap; }
    #command-container { display: flex; padding: 5px; border-top: 1px solid #555; }
    #commandInput { background-color: #6b6b6b; color: #eee; border: none; flex-grow: 1; padding: 5px; margin-right: 5px; }
  </style>
</head>
<body>
  <div id="output-container">
    <div id="output"># /</div>
  </div>
  <div id="command-container">
    <input type="text" id="commandInput" placeholder="# ">
  </div>
  <script>
    let commandHistory = [];
    let historyIndex = -1;

    function sendCommand() {
      var command = document.getElementById("commandInput").value;
      document.getElementById("commandInput").value = "";

      fetch('/execute', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ command: command })
      })
      .then(response => response.json())
      .then(data => {
        if (data.error) {
          document.getElementById("output").innerHTML += "<br># " + data.path + "<br>ERROR: " + data.error + "<br>";
        } else {
          document.getElementById("output").innerHTML += "<br># " + data.path + "<br>" + data.output + "<br>";
        }
        document.getElementById("output").innerHTML += "# " + data.path;
        document.getElementById("output-container").scrollTop = document.getElementById("output-container").scrollHeight;
      })
      .catch(error => {
        console.error('Error:', error);
        document.getElementById("output").innerHTML += "<br># " + data.path + "<br>ERROR: " + "<br>";
        document.getElementById("output-container").scrollTop = document.getElementById("output-container").scrollHeight;
      });
    }

    document.getElementById("commandInput").addEventListener("keyup", function(event) {
      if (event.key === "Enter") { sendCommand(); }
      else if (event.key === "ArrowUp") {
        if (historyIndex > 0) {
          historyIndex--;
          document.getElementById("commandInput").value = commandHistory[historyIndex];
        }
      } else if (event.key === "ArrowDown") {
        if (historyIndex < commandHistory.length - 1) {
          historyIndex++;
          document.getElementById("commandInput").value = commandHistory[historyIndex];
        } else {
          historyIndex = commandHistory.length;
          document.getElementById("commandInput").value = "";
        }
      }
    });
  </script>
</body>
</html>
"""

@app.route('/')
def index():
  return render_template_string(webShell)

@app.route('/execute', methods=['POST'])
def execute_command():
    global current_path
    command = request.json['command']

    try:
        if command.startswith("cd "):
            path = command[3:].strip()

            new_path = f"/{path}/"

            full_command = f"cd {current_path} && cd {new_path}"

            process = subprocess.Popen(['adb', 'shell', full_command],
                                        stdout=subprocess.PIPE,
                                        stderr=subprocess.PIPE,
                                        universal_newlines=True)
            stdout, stderr = process.communicate()

            if process.returncode == 0:
                current_path = new_path

        else:

            full_command = f"cd {current_path} && {command}"
            process = subprocess.Popen(['adb', 'shell', full_command],
                                        stdout=subprocess.PIPE,
                                        stderr=subprocess.PIPE,
                                        universal_newlines=True)
            stdout, stderr = process.communicate()

    except Exception as e:
        return jsonify({'error': str(e), 'path': current_path}), 500

    return jsonify({'output': stdout, 'error': stderr, 'path': current_path})

def open_browser():
  webbrowser.open("http://127.0.0.1:5000/")

if __name__ == '__main__':
  Timer(1, open_browser).start()
  app.run(debug=True)
