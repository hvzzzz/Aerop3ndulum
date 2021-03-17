from machine import Pin,PWM
import time
#def valid_val():
    
led=PWM(Pin(5),freq=50)
#led.freq(50)
#activacion
led.duty(51)#0 es 0% 100% es 1023
time.sleep_ms(5000)
#input(' espera')
#led.duty(1000)#0 es 0% 100% es 1023
#time.sleep_ms(1000)
#input(' espera x2')
while True:
    #para el motor min 54 max 117
    led.duty(70)
    #time.sleep(1)
    #for i in range(51,115,):
    #    led.duty(i)
        #t=(i/1023)*20
    #    time.sleep(1)
    #    print(i)
    #time.sleep(1)