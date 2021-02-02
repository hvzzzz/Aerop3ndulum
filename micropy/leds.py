import machine as mc
import time
p2=mc.Pin(0,mc.Pin.OUT)
buttom=mc.Pin(1,mc.Pin.IN)
#p2.on()
p2.off()
while True:
    if buttom.value()==1:
        print(int(buttom.value()))
        p2.on()
    else:
        p2.off()