import time
import numpy as np
import os
import matplotlib.pyplot as plt
import pandas as pd
os.popen('ampy --port /dev/ttyS5 get data.txt d.txt')
data = pd.read_csv('d.txt',sep=" ", header = None)
data.columns=["Time","Angle"]
time=data['Time']
angle=data['Angle']
plt.plot(time,angle)
plt.savefig("datos.png",dpi=150)
print(time)
for i in range(len(time)):
    print('%5i %5i'% (time[i],angle[i]))
#data=data.replace("\n"," ")
#data=np.asarray(data)
#print(data[0][0:10])