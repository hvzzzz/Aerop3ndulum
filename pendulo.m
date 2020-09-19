function  xp=pendulo(t,x)

%Vector de estados (entradas) --------------------------------------------%
    q=x(1);  %posición articular
    qp=x(2); %velocidad articular
%-------------------------------------------------------------------------%    

%Parámetros del péndulo --------------------------------------------------%
    m1=0.21;      %masa
    m2=0.16;
    lc=0.6;  %centro de gravedad
    g=9.81;   %constante de aceleración gravitacional
    b=0.074;   %coeficiente de fricción viscosa
    fc=0.45;  %coeficiente de fricción de Coulomb
    Ip=0.083;  %momento de inercia del rotor
    %Ip=m*lc^2+Ir;
%-------------------------------------------------------------------------%

%Par aplicado (controlador) ----------------------------------------------%
    tau = pdpendulo(q,qp);
    %[~, tau]=control_pendulo_sinhcosh_m(t,q,qp);
%-------------------------------------------------------------------------%    
  
%Modelo dinámico del péndulo ---------------------------------------------%
    %qpp=(tau-b*qp-m*g*lc*sin(q)-fc*sign(qp))/Ip;
%-------------------------------------------------------------------------%    
%qpp=(tau-b*qp-m*g*lc*sin(q)-fc*tanh(10000*qp))/Ip;
qpp=(tau-b*qp-(m2+m1/2)*g*lc*sin(q))/Ip;
%qpp=(tau-b*qp-m*g*lc*sin(q))/Ip;
%Vector de salida --------------------------------------------------------%




    xp=[qp;    %xp(1)=x(2) velocidad articular
           qpp];  %xp(2)=qpp  aceleración articular
%-------------------------------------------------------------------------%
end
