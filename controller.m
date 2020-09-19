function tau_ri=controller(x,xp)
theta=x;
thetap=xp;
m1=0.21;m2=0.16;L=0.6;g=9.81;
%algoritmo de control
theta_d=90;
tau_ri_max=60;
kp=0.8*tau_ri_max;%ganancia derivativa
kv=0.1*kp;%ganancia proporcional
par_grav=L*g*(m2+m1/2)*sin(theta);%par gravitacional
theta_t=theta_d-theta;%error de posicion
tau_ri=kp*theta_t-kv*thetap*180/pi+par_grav;%control PD
end