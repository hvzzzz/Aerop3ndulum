from machine import Pin, PWM, ADC, UART
#import uos
import time 
import os
#uos.dupterm(None,1)
#uart=UART(0,115200)
#uart.init(115200,bits=8,parity=None,stop=1)
os.remove('d.txt')
file=open('d.txt', 'w')
led=PWM(Pin(5))
led.freq(90)
input_adc=ADC(0)
lect=0
i=0
flag=True
start_time=time.time()
seconds=10
print('Empieza el Experimento')
while True:
    current_time = time.time()
    elapsed_time = current_time - start_time

    if elapsed_time > seconds:
        break
    #if uart.any()>0:
        #uart.write(i)
    lect=input_adc.read()
        #if(lect==b'ok'):
            #flag=False
        #print(type(lect))
    led.duty(lect)# va desde 0 a 1023
        #print('ingrese valor de 0 a 1024')
        #a=input()
        #a=int(a)
        #led.duty(a)
    #time.sleep_ms(100)
    file.write(str(elapsed_time)+' '+str(lect)+'\n')
        #uart.write('dato: ')
        #lect=put_ceros(lect)
        #uart.write(bytearray(lect))
        #if (i%50==0):
        #    send_marker(flag)
        #i=i+1
file.close()
print('Experimento Acabado')
#falta hacer que una vez ya se tenga reconocido el marcador la pc le avise y que el micro ya no envie el marcador
