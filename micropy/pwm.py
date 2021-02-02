from machine import Pin,PWM
led=PWM(Pin(5))
led.freq(10)
led.duty(100)#0 es 0% 100% es 1023