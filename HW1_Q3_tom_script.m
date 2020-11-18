%% HW 3 Q6 Tom Lev-ron IOE course
% a section (prism => Silver => Gold => analyte)
clc;clear;close all;
l_fixed = 632.8; % in nm
n_air = 1; n_water = 1.33;
d_Ag = [35,40,45,50,55];
d_35 = [NaN,d_Ag(1),inf];
d_40 = [NaN,d_Ag(2),inf];
d_45 = [NaN,d_Ag(3),inf];
d_50 = [NaN,d_Ag(4),inf];
d_55 = [NaN,d_Ag(5),inf];
polarization_te = 0; polarization_tm = 1; % Tm = P ; Te = s
conv_coef=1239.8424; %Conversion coefficent for the eV units

n_p = Prism_SF11(l_fixed);
n_Ag = Ag_ref_index(l_fixed);
n = [n_p, n_Ag, n_air];

theta=30:0.1:60;

for i=1:length(theta)
    [r_35(i),t_35(i),R_35(i),T_35(i),A_35(i)]= ABELES(l_fixed,d_35,n,deg2rad(theta(i)),polarization_tm);
    [r_40(i),t_40(i),R_40(i),T_40(i),A_40(i)]= ABELES(l_fixed,d_40,n,deg2rad(theta(i)),polarization_tm);
    [r_45(i),t_45(i),R_45(i),T_45(i),A_45(i)]= ABELES(l_fixed,d_45,n,deg2rad(theta(i)),polarization_tm);
    [r_50(i),t_50(i),R_50(i),T_50(i),A_50(i)]= ABELES(l_fixed,d_50,n,deg2rad(theta(i)),polarization_tm);
    [r_55(i),t_55(i),R_55(i),T_55(i),A_55(i)]= ABELES(l_fixed,d_55,n,deg2rad(theta(i)),polarization_tm);
end
figure;
plot(theta,R_35,theta,R_40,theta,R_45,theta,R_50,theta,R_55,'linewidth',2)
% ylim([0,1])
 xlim([30 44])
grid on;
title('Reflection as function of incident angle at fixed wavelength of 633 nm')
xlabel('\Theta [deg]')
ylabel('Reflectivity')
legend('R-TM Ag thickness of 35 nm','R-TM Ag thickness of 40 nm','R-TM Ag thickness of 45 nm',...
    'R-TM Ag thickness of 50 nm', 'R-TM Ag thickness of 55 nm')

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