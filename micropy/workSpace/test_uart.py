from machine import Pin, UART
#import uos
#uos.dupterm(None,1)
uart=UART(0,115200)
uart.init(115200,bits=8,parity=None,stop=1)
led=Pin(5,Pin.OUT)
ch=b''
i=0
i=str(i)
while True:
    if uart.any()>0:
        ch= uart.readline()
        if ch==b'on':
            uart.write('led on')
            led.on()
            #temp=type(i)
            uart.write(bytearray(i))
            i=int(i)
            i=i+1
            i=str(i)
        elif ch==b'off':
            uart.write('led off')
            led.off()
        else:
            uart.write('recibi: ')
            uart.write(ch)
