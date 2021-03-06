function xp=torq_control(t,x)
%omega_ri=x(1,1);
tau=x(1,1);
z_ri=x(2,1);
sigma0_ri=0.2;
sigma1_ri=0.02;
b_ri=0.023;
I_ri=0.057;
fc_ri=0.0034;
fs_ri=0.07;
omega_sri=3*pi/180;
%omega_d=90*pi/180;
tau_d=1;
kp_ri=5.5;
%omega_tilde=omega_d-omega_ri;
tau_tilde=tau_d-tau;
mu_ri=(fc_ri+(fs_ri-fc_ri)*exp(-abs(omega_ri/omega_sri)^2));
zp_ri=omega_ri-sigma0_ri*abs(omega_ri)*z_ri/mu_ri;
tauf_ri=sigma0_ri*z_ri+sigma1_ri*zp_ri+b_ri*omega_ri;
%tau_ri=kp_ri*omega_tilde;
omega_ri=kp_ri*tau_tilde;
taup_ri=I_ri*omega_ri+tauf_ri;
%omegap_ri=(tau_ri-tauf_ri)/I_ri;
%xp=[omegap_ri;zp_ri];
xp=[taup_ri;zp_ri];
end