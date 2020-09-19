clc;
clear all;
close all;
format short 
%animacion=1; % 0:Deshabilita 1:Habilita animación
 
%Parámetros de simulación ------------------------------------------------%
    ti=0; %tiempo inicial (segundos)   
    tfinal=20; %tiempo de final (segundos)
    h=0.0025; %periodo de muestreo (segundos)
    ts=ti:h:tfinal; %vector de tiempo
    opciones=odeset('RelTol' ,1e-06, 'AbsTol',1e-06,'InitialStep' ,h,'MaxStep',h);
%-------------------------------------------------------------------------%

ci=[0; 0;0;0];
%Solución numérica del sistema -------------------------------------------%
 %   [t,x]=ode45('pendulo',[ti; tfinal],[89.999*pi/180; 0],opciones);
    [t,x]=ode45('sys_din_model',ts, ci,opciones);

   % subplot(2,2,1);    plot(t,180*x(:,1)/pi,t,90-180*x(:,1)/pi)
   %  subplot(2,2,2);    plot(t,x(:,2))
    % subplot(2,2,3);    plot(x(:,2),90-180*x(:,1)/pi)
     error_pos=90-180*x(:,1)/pi;%[grad/seg]
     pos=180*x(:,1)/pi;%[grad/seg]
     velocidad_articular=180*x(:,2)/pi;%[grad/seg]
     velocidad_motor=x(:,3);%[rad/seg]
     velocidad1_motor=x(:,3)*60/(2*pi);%[rpm]
     subplot(3,1,1);    plot(t,pos)
     xlabel('Tiempo[seg]');ylabel('Posicion Articular[grad]');
     subplot(3,1,2);    plot(t,error_pos)
     xlabel('Tiempo[seg]');ylabel('Error de Posicion[grad]');
     subplot(3,1,3);    plot(t,velocidad1_motor)
     xlabel('Tiempo[seg]');ylabel('Velocidad del Motor[rpm]');
   
   
     