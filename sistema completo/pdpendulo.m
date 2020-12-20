function tau = pdpendulo(t,x,xp)
    global n h tau1
    h=0.0025;
%Vector de estados (entradas) --------------------------------------------%
    q=x;  %posici�n articular
    qp=xp; %velocidad articular
%-------------------------------------------------------------------------%
    m1=0.21;      %masa
    m2=0.16;
    lc=0.6;  %centro de gravedad
    g=9.81;   %constante de aceleraci�n gravitacional
    tau_max=1; 
    qd=pi*90/180; %referencia (posici�n deseada)
    
    
%Par�metros del controlador ----------------------------------------------%
    kp= 0.5*tau_max/qd; %ganancia proporcional
    kv=0.4*kp; %ganancia derivativa
    %kp(q,qp)=(1-exp(-qt*qt))
%-------------------------------------------------------------------------%

%Vector de pares de gravitacionales --------------------------------------%
    par_grav = (m2+m1/2)*g*lc*sin(q);
%-------------------------------------------------------------------------%               


%Controlador tanh() ------------------------------------------------------%
    qt=qd-q; %error de posici�n
    tau=kp*180*qt/pi-kv*180*qp/pi+par_grav;
    %M�s esquemas de control......
    %tau=kp*sin(pi*tanh(qt)/2)-kv*sin(pi*tanh(qp)/2)+par_grav;
   % tau=kp*qt/(1+qt*qt)-kv*qp/(1+qp*qp)+par_grav;
    %tau=5*sign(180*qt/pi)-1*sign(180*qp/pi)+par_grav;
    %tau=kp*tanh(qt)-kv*tanh(qp)+par_grav;
     %tau=5*atan(180*qt/pi)-5*atan(180*qp/pi)+par_grav;
     %tau=0.0001*sinh(180*qt/pi)-0.0001*sinh(180*qp/pi)+par_grav;
%-------------------------------------------------------------------------%   
    if(round(t/h)==n)
        tau1(n)=tau;
        n=n+1;
    end
end
