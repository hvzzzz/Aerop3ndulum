from machine import Pin, Timer
import time
def run():
    global t
    print(t)
    t=t+1
    return None

#led=Pin(5,Pin.OUT)
#led.value(0)
#timer=Timer(-1)
#timer.init(period=1000,mode=Timer.PERIODIC,callback=lambda t:led.value(not led.value()))
tim=Timer(-1)
t=0
tim.init(period=1000, mode=Timer.PERIODIC, callback=lambda t:run())
#tim.init(period=1000)
#tim.init(mode=Timer.PERIODIC, period=1000)
#print(t)
#t=t+1
time.sleep(5)
tim.deinit()