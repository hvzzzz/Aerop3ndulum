clc;clear all; close all;
ti=0;tf=20;h=0.00001;%tiempos de inializacion de la simulacion
t=ti:h:tf;%vector del tiempo
[m,n]=size(t);
%salida
y=zeros(n,m);
%y1=zeros(n,m);
%Entradas
u=ones(n,m);
a0=14.379;a1=0.9;a2=1;alpha=12.04;%constantes del modelo dinamico
%a00=26.519;%constantes del modelo dinamico
for k=3:n
    y(k)=(1/(a2/h^2+a1/h+a0))*(alpha*u(k)+(2*a2/h^2+a1/h)*y(k-1)-(a2/h^2)*y(k-2));
    %y1(k)=(1/(a2/h^2+a1/h+a00))*(alpha*u(k)+(2*a2/h^2+a1/h)*y1(k-1)-(a2/h^2)*y1(k-2));
end
fig=figure();
%subplot(1,2,1);
plot(t,y);title('Respuesta al Escalon Unitario');xlabel('Tiempo[Segundos]');grid on;ylabel('\theta(t)[rad]');axis([0 20 -1.5 1.5]);