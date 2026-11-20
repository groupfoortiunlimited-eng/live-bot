from flask import Flask
import subprocess, threading, os, time

app = Flask(__name__)

def start_live():
    while True:
        subprocess.run(["bash", "start.sh"])
        time.sleep(5)

@app.route('/')
def home():
    return "Live ON - Robot Jagay Ase!"

threading.Thread(target=start_live, daemon=True).start()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=10000)
