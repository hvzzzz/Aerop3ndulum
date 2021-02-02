from machine import Pin, PWM, ADC, UART
import uos
import time 

def put_ceros(lect):
    lect=str(lect)
    if len(lect)==2:
        lect='00'+lect
    elif len(lect)==3:
        lect='0'+lect
    return lect

def send_marker():
    mark='9999'
    uart.write(bytearray(mark))

uos.dupterm(None,1)
uart=UART(0,115200)
uart.init(115200,bits=8,parity=None,stop=1)

led=PWM(Pin(5))
led.freq(90)
input_adc=ADC(0)
lect=0
i=0
while True:
    if uart.any()>0:
        #uart.write(i)
        lect=input_adc.read()
        #print(type(lect))
        led.duty(lect)# va desde 0 a 1023
        #print('ingrese valor de 0 a 1024')
        #a=input()
        #a=int(a)
        #led.duty(a)
        #time.sleep_ms(100)
        #print(lect)
        #uart.write('dato: ')
        lect=put_ceros(lect)
        uart.write(bytearray(lect))
        if (i%50==0):
            send_marker()
#falta hacer que una vez ya se tenga reconocido el marcador la pc le avise y que el micro ya no envie el marcador
