%% HW 3 Q6 Tom Lev-ron IOE course
% a section (prism => Silver => Gold => analyte)
clc;clear;close all;
l_fixed = 632.8; % in nm
n_air = 1; n_water = 1.33;
d_Ag = 50;
d = [NaN,d_Ag,inf];

conv_coef=1239.8424; %Conversion coefficent for the eV units

n_p = Prism_SF11(l_fixed);

n_Ag = Ag_ref_index(l_fixed);

theta=30:0.1:60;
n = [n_p, n_Ag, n_air];
polarization_te = 0; polarization_tm = 1; % Tm = P ; Te = s
for i=1:length(theta)
    [r1(i),t1(i),R1(i),T1(i),A1(i)]= ABELES(l_fixed,d,n,deg2rad(theta(i)),polarization_te);
    [r2(i),t2(i),R2(i),T2(i),A2(i)]= ABELES(l_fixed,d,n,deg2rad(theta(i)),polarization_tm);
end
figure;
plot(theta,R1,theta,R2)
% ylim([0,1])
% xlim([40 60])
grid on;
title('Reflection as function of incident angle at fixed wavelength of 633 nm')
xlabel('\Theta [deg]')
ylabel('Reflectivity')
legend('R-TE','R-TM')

%% Sensitiviy check
n3 = [n_p, n_Ag, 1.33+0.015];
n4 = [n_p, n_Ag, 1.33+0.03];
for i=1:length(theta)
    [r3(i),t1_1(i),R3(i),T3(i),A3(i)]= ABELES(l_fixed,d,n3,deg2rad(theta(i)),polarization_tm);
    [r4(i),t4(i),R4(i),T4(i),A4(i)]= ABELES(l_fixed,d,n4,deg2rad(theta(i)),polarization_tm);
end
figure;
plot(theta,R3,theta,R4)
% ylim([0,1])
% xlim([40 60])
grid on;
title('Reflection as function of incident angle at fixed wavelength of 633 nm')
xlabel('\Theta [deg]')
ylabel('Reflectivity')
legend('R-TM3','R-TM4')