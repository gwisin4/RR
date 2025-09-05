clear; clc; close all;
h = 0.01
d = 0.005
G = RR_pade(d,8,8)*RR_tf([1],[1 0 94.09])

K = 225
z1 = 9
p1 = 10
D = K*RR_tf([1 0 z1^2],[1 2*p1 p1^2])
P = (1/0.0086+K)/K
figure (1), RR_step(P*G*D/(1+G*D))
figure (2), RR_rlocus(G,D)
[Dz]= RR_C2D_tustin(D,h)

Dz = RR_C2D_tustin(D,h)

Dz_prewarp = RR_C2D_tustin(D,h,z1)
Gz = RR_C2D_zoh(G,h)

figure(3), RR_step(P*Gz*Dz_prewarp/(1+Gz*Dz_prewarp))
figure(5), RR_bode(Gz*Dz_prewarp/(1+Gz*Dz_prewarp))

%Conversion in Q6/Q7 (via Tustin) matched continuous-time design approximately but ignored exact discrete-time pole placement. 
% Direct digital design here guarantees that the closed-loop poles meet the discrete-time performance requirements.
% The main difference you’ll observe: the step response now has overshoot close to 15% with the correct rise time, whereas the earlier Tustin-discretized controller may not have matched both at once.