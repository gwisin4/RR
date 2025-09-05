Gs = RR_tf([1],[1 0 100])
K = 255
z1 = 10
p1 = 10
Ds = K*RR_tf([1 0 z1^2],[1 2*p1 p1^2])
P = (1/0.01+K)/K
figure (2), RR_step(P*Gs*Ds/(1+Gs*D))
figure (1), RR_rlocus(Gs,Ds)