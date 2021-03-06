close all;clear;clc;
na = 1.00; %n for air
n1 = 2.45; %n for Bi2O3
n2 = 4.20; %n for Ge
n_SiN = 1.87;
nb = 3.47; %n for Si

n = [na,n1,n2,nb];
la0 = 1600;
for i=1:1:3
    r(i)=(n(i)-n(i+1))/(n(i)+n(i+1));
end
c = sqrt((r(1)^2*(1-r(2)*r(3))^2 - (r(2)-r(3))^2)/(4*r(2)*r(3)*(1-r(1)^2)));
k2l2 = acos(c);
G2 = (r(2)+r(3)*exp(-2*1i*k2l2))/(1 + r(2)*r(3)*exp(-2*1i*k2l2));
k1l1 = (angle(G2) - pi - angle(r(1)))/2;
if k1l1 <0, k1l1 = k1l1 + 2*pi; end
L = [k1l1,k2l2]/2/pi;
la = linspace(1450,1750,101);
Ga = abs(multidiel(n, 0.25, la/la0,0,'tm')).^2;
Gb = abs(multidiel([na,n1,nb], 0.25, la/la0)).^2;
Gc = abs(multidiel([na,n_SiN,nb], 0.25, la/la0,0,'te')).^2;
plot(la, Ga, la, Gb, la, Gc);
legend('Ga','Gb','Gc')