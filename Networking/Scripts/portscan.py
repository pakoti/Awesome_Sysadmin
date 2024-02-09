#!/bin/python

#libraries that we used
import socket
from queue import Queue
import threading
import time
import platform


print("[*]Script Will Check All port on the localhost")
#calculating process time
start=time.perf_counter()

#to scan ports in our system
#change this setting to change ip and port
ip="localhost"
open_ports=[]
closed_ports=[]
queue=Queue()


s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)


#functions that are used.
def check_platform():
	print("[*]The Platform You are currently running script:")
	print(platform.system())
	print(platform.release())
	print(platform.version())
def create_port():
	
    for port in range(1,65535):
        queue.put(port)

def scan():
    while not queue.empty():
        port=queue.get()
        if pscan(port)==True:
            open_ports.append(port)
        else:
            closed_ports.append(port)

def pscan(port):
    try:
        s.connect((ip,port))
        return True
    except:
        return False

def tred(threads):

    create_port()
    thread_list=[]

    for t in range(threads):
        thread=threading.Thread(target=scan)
        thread_list.append(thread)

    for thread in thread_list:
        thread.start()

    for thread in thread_list:
        thread.join()
        
#main function    
def main():
    tred(1000)
	
if __name__=="__main__":main() 
finish=time.perf_counter()
check_platform()
print("[*]Whole process Finished in:")
print(finish-start)
print("[*]This ports were open:\n",open_ports)
print()
print("[*]This ports were closed:\n",closed_ports)
print()