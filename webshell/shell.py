#########################################################
# - ADB shell parser webGUI v.0.1                       #
#                                                       #
# Author: Alexandr Gomez @alexandrglm                   #
#                                                       #
# Nov,6.2024                                            #
#########################################################
#
## Comments:
# The main idea is using a functional shell on a self-contained html
# parsing an input to adb shell "" commands
# with mainly shell functions like:
# - Commands history
# - Input/returns auto-scroll
# - TAB helping with no browser conflicts
# - 'cd' memorized paths
#
# Simple python server config, needs to be updated to a jetty2 srv, included in dongle' firmware.
#
## py dependencies:
# pip install Flask / apt install python3-flask

import os
import subprocess
import shlex
from threading import Timer
from flask import Flask, request, jsonify, render_template_string

app = Flask(__name__)
current_path = "/"

webShell = """
<!DOCTYPE html>
<html>
<head>
  <title>ADB shell parser webGUI v.0.1</title>
  <style>
  body {  background-color: #444;  color: #eee;  font-family: monospace;  display: flex;  flex-direction: column;  height: 100vh;  margin: 0;  }
  #output-container {  flex-grow: 1;  overflow-y: auto;  padding: 10px;  border: 1px solid #555;  }
  #output {  white-space: pre-wrap  }
  #command-container {  display: flex;  padding: 5px;  border-top: 1px solid #555;  }
  #commandInput {  background-color: #444;color: #eee;  border: solid 1px rgba(176, 251, 15, 0.8);  flex-grow: 1;  padding: 5px;  margin-right: 5px;  }
  </style>
</head>
<body>
  <div id="output-container">
    <div id="output"># </div>
  </div>
  <div id="command-container">
    <input type="text" id="commandInput" placeholder="# :">
  </div>
<script>
  let commandHistory = [];
  let historyIndex = -1;

  function sendCommand() {
    var command = document.getElementById("commandInput").value;

    if (command.trim() !== "") {
      commandHistory.push(command);
      historyIndex = commandHistory.length;
    } // fuck the syntax

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
// fuck the indentation, this is a helper
  document.getElementById("commandInput").addEventListener("keyup", function(event) {
    if (event.key === "Enter") {
      sendCommand();
    } else if (event.key === "ArrowUp") {
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

    if command.startswith("cd "):
        try:
            path = shlex.split(command[3:].strip())[0]
            new_path = os.path.normpath(os.path.join(current_path, path))
            full_command = f"cd {new_path} && pwd"
            process = subprocess.Popen(['adb', 'shell', full_command],
                                       stdout=subprocess.PIPE,
                                       stderr=subprocess.PIPE)
            stdout, stderr = process.communicate()
            output = stdout.decode('utf-8').strip() if stdout else stderr.decode('utf-8')

            if output == new_path:
                current_path = new_path
                return jsonify({'output': "", 'path': current_path})
            else:
                return jsonify({'error': f"{path} does not exist", 'path': current_path}), 400

        except Exception as e:
            return jsonify({'error': str(e), 'path': current_path}), 500

    try:
        full_command = f"cd {current_path} && {command}"
        process = subprocess.Popen(['adb', 'shell', full_command],
                                   stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE)
        stdout, stderr = process.communicate()
        output = stdout.decode('utf-8') if stdout else stderr.decode('utf-8')
        return jsonify({'output': output, 'path': current_path})

    except Exception as e:
        return jsonify({'error': str(e), 'path': current_path}), 500

def open_browserGeneric():
    webbrowser.open("http://127.0.0.1:5000")

if __name__ == '__main__':
    Timer(1, open_browserGeneric).start()
    app.run(debug=True)
