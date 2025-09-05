clear; clc; close all;
h = 0.01
d = 0.005
G = RR_pade(d,8,8)*RR_tf([1],[1 0 94.09])

K = 315
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

figure(3), RR_step(Gz*Dz_prewarp/(1+Gz*Dz_prewarp))
figure(5), RR_bode(Gz*Dz_prewarp/(1+Gz*Dz_prewarp))


