from machine import Pin, PWM, ADC, Timer
import time 
import os
import math
def get_duty(force,popt):
    dutys=(-popt[1]+math.sqrt(popt[1]*popt[1]-4*popt[0]*(popt[2]-force)))/(2*popt[0])
    dutys=round(dutys)
    return dutys
def write_data(step):
    global elapsed_time
    elapsed_time=elapsed_time+step
    lect=input_adc.read()
    file.write(str(elapsed_time)+' '+str(lect)+'\n')
    return None
os.remove('data.txt')
file=open('data.txt','w')
#header
#file.write('Time'+' '+'Angle'+'\n')
ESC=PWM(Pin(5),freq=50)
popt=[-2.09182685e-03,3.41304157e-01,-1.22589854e+01]
q=0
qd=0
print('Inicia la Activacion del Motor')
ESC.duty(51)
time.sleep_ms(5000)

input_adc=ADC(0)
#start_time=time.time()
#start_time=time.ticks_us()
seconds=10
step=50#in milliseconds
print('Empieza el Experimento')
elapsed_time=0
tim=Timer(-1)
tim.init(period=step, mode=Timer.PERIODIC, callback=lambda t:write_data(step))
time.sleep(seconds)
tim.deinit()
#while True:
#    #current_time = time.time()
#    current_time = time.ticks_us()
#    #elapsed_time = current_time - start_time
#    elapsed_time = time.ticks_diff(current_time,start_time)*1e-6
#    if elapsed_time > seconds:
#        break
#    lect=input_adc.read()
#    ESC.duty(60)
#    file.write(str(elapsed_time)+' '+str(lect)+'\n')
ESC.duty(51)
file.close()
print('Experimento Acabado')