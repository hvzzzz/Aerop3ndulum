import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import curve_fit
import pandas as pd
def func(x, a, b, c):
    return a*x*x + b*x+c
df1 = pd.read_excel(r'/mnt/c/Users/hanan/OneDrive/Desktop/force.xlsx',sheet_name='Sheet1')
duty=df1['Duty'][0:28]
force=df1['Fuerza'][0:28]
#print(force[27])
plt.subplot(2,1,1)
plt.plot(duty, force, 'o', label='Data')
popt, pcov = curve_fit(func, duty, force)
plt.plot(duty, func(duty, *popt), '-',label='Fit: a=%5.3f, b=%5.3f, c=%5.3f' % tuple(popt))
plt.rc('text',usetex=True)
plt.rc('font',family='serif')
#plt.xlabel(r'Duty Cycle$[\%]$',fontsize=12)
plt.ylabel(r'Force$[N]$',fontsize=12)
plt.grid(True)
plt.legend()
print(popt)

#inversa  
#inv_duty=(-popt[1]+np.sqrt(popt[1]*popt[1]-4*popt[0]*(popt[2]-force)))/(2*popt[0])
#plt.subplot(2,1,2)
##plt.plot(force,inv_duty,label='original')
##plt.plot(np.ceil(inv_duty),force,label='ceil')
#plt.plot(np.round(inv_duty),force,label='round')
##plt.plot(np.floor(inv_duty),force,label='floor')
##plt.plot(duty, force, 'o', label='Data')
#plt.plot(duty, func(duty, *popt), '-',label='Fit: a=%5.3f, b=%5.3f, c=%5.3f' % tuple(popt))
#plt.legend()
#plt.xlabel(r'Duty Cycle$[\%]$',fontsize=12)
#plt.savefig("plot.png",dpi=150)
#for i in range(len(inv_duty)):
#    print('%5i %5.6f'% (duty[i],force[i]))
##print(np.round(inv_duty))

#other vales
fuer=np.linspace(0,1.6,num=50)
dutis=inv_duty=(-popt[1]+np.sqrt(popt[1]*popt[1]-4*popt[0]*(popt[2]-fuer)))/(2*popt[0])
dutis=np.round(dutis)
plt.subplot(2,1,2)
plt.plot(fuer,dutis)
plt.plot(func(duty, *popt),duty, '-',label='Fit: a=%5.3f, b=%5.3f, c=%5.3f' % tuple(popt))
plt.savefig("plot.png",dpi=150)
print(dutis)