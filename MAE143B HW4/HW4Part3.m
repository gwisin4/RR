clear; clc; close all;
d = 0.005
G = RR_pade(d,2,2)*RR_tf([1],[1 0 94.09])

K = 315
z1 = 9
p1 = 10
D = K*RR_tf([1 0 z1^2],[1 2*p1 p1^2])
P = (1/0.0086+K)/K
figure (1), RR_step(P*G*D/(1+G*D))
figure (2), RR_rlocus(G,D)

% It doesn't settle for all of K as if K is 4100 or above it can be unstable and the
% step value oscilliates and never settles. It also gives us an irregular
% value if we plug it in which means that we can change it up. Omega value
% is gonna change once it hits around 64.03 when the value does not fit.  