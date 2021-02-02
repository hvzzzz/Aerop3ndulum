import network as net
from machine import Pin
led=Pin(1,Pin.OUT)
s=net.WLAN(net.STA_IF)
s.active(True)
def wifi_connect():
    print('WI-FI')
    s.disconnect()
    led.off()
    s.connect('CORINITA\'S_HOUSE','mamitacorinacha')
    print('Conectando...')
    while not s.isconnected():
        pass
    print('Conectado')
    led.on()

wifi_connect()