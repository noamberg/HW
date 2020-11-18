%% HW 3 Q6 Tom Lev-ron IOE course
% a section (prism => Silver => Gold => analyte)
clc;clear;close all;
l_fixed = 632.8; % in nm
n_air = 1; n_water = 1.33;
d_Ag = 35;
d = [NaN,d_Ag,inf];

conv_coef=1239.8424; %Conversion coefficent for the eV units

n_p = Prism_SF11(l_fixed);

n_Ag = Ag_ref_index(l_fixed);

theta=30:0.1:60;
thita=30:0.1:60;
n = [n_p, n_Ag, n_air];
polarization_te = 0; polarization_tm = 1;
for i=1:length(thita)
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