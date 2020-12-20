function  xp=sys_din_model(t,x)

%Vector de estados (entradas) --------------------------------------------%
    q=x(1);  %posici�n articular
    qp=x(2); %velocidad articular
    omega_ri=x(5);
    z_ri=x(4);
    z_q=x(3);
%-------------------------------------------------------------------------%    

%Par�metros del p�ndulo --------------------------------------------------%
    m1=0.21;      %masa
    m2=0.16;
    lc=0.6;  %centro de gravedad
    g=9.81;   %constante de aceleraci�n gravitacional
    b=0.074;   %coeficiente de fricci�n viscosa
    fc=0.45;  %coeficiente de fricci�n de Coulomb
    Ip=0.083;  %momento de inercia del rotor
    %Ip=m*lc^2+Ir;
%-------------------------------------------------------------------------%
%Parametros rotor
    sigma0_ri=0.2;
    sigma1_ri=0.02;
    b_ri=0.023;
    I_ri=0.057;
    fc_ri=0.0034;
    fs_ri=0.07;
    omega_sri=3*pi/180;
%
%Parametros de la friccion del aire
    sigma0_q=0.038;
    sigma1_q=0.01;
    fc_q=0.44;
    fs_q=0.52;
    qp_sp=3*pi/180;
%Par aplicado (controlador) ----------------------------------------------%
    tau = pdpendulo(t,q,qp);
    %[~, tau]=control_pendulo_sinhcosh_m(t,q,qp);
%-------------------------------------------------------------------------%    
%Modelo de la friccion del aire
    mu_q=(fc_q+(fs_q-fc_q)*exp(-abs(qp/qp_sp)^2));
    z_qp=qp-sigma0_q*z_q*(abs(q))/(mu_q);


%Modelo din�mico del p�ndulo ---------------------------------------------%
    %qpp=(tau-b*qp-m*g*lc*sin(q)-fc*sign(qp))/Ip;
%-------------------------------------------------------------------------%    
%qpp=(tau-b*qp-m*g*lc*sin(q)-fc*tanh(10000*qp))/Ip;
    par_grav=(m2+m1/2)*g*lc*sin(q);
    air_fric=sigma0_q*z_q+sigma1_q*z_qp;
    qpp=(tau-b*qp-par_grav-air_fric)/Ip;
%qpp=(tau-b*qp-m*g*lc*sin(q))/Ip;
%Vector de salida --------------------------------------------------------%

%Modelo dinamico rotor

    mu_ri=(fc_ri+(fs_ri-fc_ri)*exp(-abs(omega_ri/omega_sri)^2));
    zp_ri=omega_ri-sigma0_ri*abs(omega_ri)*z_ri/mu_ri;
    tauf_ri=sigma0_ri*z_ri+sigma1_ri*zp_ri+b_ri*omega_ri;
%tau_ri=kp_ri*omega_tilde;
    omegap_ri=(tau-tauf_ri)/I_ri;

    xp=[qp;    %xp(1)=x(2) velocidad articular
        qpp;
        omegap_ri;%omegap_ri
        zp_ri;
        z_qp];  %xp(2)=qpp  aceleracion articular
%-------------------------------------------------------------------------%
end