clear; clc; close all;
h = 0.01;
d = 0.005;

% Plant with delay
G = RR_pade(d,8,8)*RR_tf([1],[1 0 94.09]);

% Notch controller
K = 315;
z1 = 9;
p1 = 10;
D = K*RR_tf([1 0 z1^2],[1 2*p1 p1^2]);

% Prefactor for unity steady-state gain
P = (1/0.0086 + K)/K;

% Plots
figure(1), RR_step(P*G*D/(1+G*D)), title('Continuous-time closed loop')
figure(2), RR_rlocus(G,D), title('Root locus')

% Discretize controller with Tustin + prewarp at z1=9 rad/s
Dz = RR_C2D_tustin(D, h, z1);   % <-- third input is prewarp frequency

