clc; clear all; close all;
t=[0:0.0025:10]';
%a=10.34;b=4.85;
a=0.023;b=0.098;
y=a*sin(t)+b*cos(t);
%minimun squares
p=2;
theta_e=[1:p]';
Fi=[1:p]';
theta_e(1)=0;
P=eye(p,p)*10e10;
n=size(t);
for k=1:n
    Fi(1)=sin(t(k));
    Fi(2)=cos(t(k));
    e=y(k)-theta_e'*Fi;
    theta_e=theta_e+(P*Fi*e)/(1+Fi'*P*Fi);
    P=P-(P*Fi*Fi'*P)/(1+Fi'*P*Fi);
end
theta_e