import serial
import time
import numpy as np
import matplotlib.pyplot as plt
print("Start")
port="COM5"
data=serial.Serial(port, 115200)
print("Connected")
data.flushInput()
#detectar el inicio de una linea
flag=True
while flag:
    received=data.read()
    if(received==b'9'):
        if(received==b'9'):
            if(received==b'9'):
                if(received==b'9'):
                    flag=False
                    data.write(b'ok')
while True:
#for i in range (20):
    #print(i)
    #print('pasa')
    rece_data=data.read(4)
    print(rece_data)
    #data.write('on'.encode())
    #time.sleep(0.1)
    #data.write('off'.encode())