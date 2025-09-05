clear; clc; close all;
G = RR_tf([1],[1 0 94.09])
%New poles are 0.97|10i| & 0.97|-10i|

K = 315
z1 = 9
p1 = 10
D = K*RR_tf([1 0 z1^2],[1 2*p1 p1^2])
P = (1/0.0086+K)/K
figure (1), RR_step(P*G*D/(1+G*D))
figure (2), RR_rlocus(G,D)
% poles are 0.97|10i| & 0.97|-10i|