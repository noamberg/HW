%% HW 3 Q6 Tom Lev-ron IOE course
% a section (prism => Silver => Gold => analyte)
clc;clear;close all;
l_fixed = 632.8; % in nm
n_air = 1; n_w = 1.33;

d_Ag_air = [35,40,45,50,55]; d_35_air = [NaN,d_Ag_air(1),inf];
d_40_air = [NaN,d_Ag_air(2),inf]; d_45_air = [NaN,d_Ag_air(3),inf];
d_50_air = [NaN,d_Ag_air(4),inf]; d_55_air = [NaN,d_Ag_air(5),inf];

d_Ag_water = [35,40,45,50,55]; d_35_water = [NaN,d_Ag_water(1),inf];
d_40_water = [NaN,d_Ag_water(2),inf]; d_45_water = [NaN,d_Ag_water(3),inf];
d_50_water = [NaN,d_Ag_water(4),inf]; d_55_water = [NaN,d_Ag_water(5),inf];

polarization_te = 0; polarization_tm = 1; % Tm = P ; Te = s
conv_coef=1239.8424; %Conversion coefficent for the eV units

n_p = Prism_SF11(l_fixed);
n_Ag = Ag_ref_index(l_fixed);
n_air = [n_p, n_Ag, n_air];
n_water = [n_p, n_Ag, n_w];
theta=30:0.1:65;

for i=1:length(theta)
    [r_35(i),t_35(i),R_35_air(i),T_35(i),A_35(i)]= ABELES(l_fixed,d_35_air,n_air,deg2rad(theta(i)),polarization_tm);
    [r_40(i),t_40(i),R_40_air(i),T_40(i),A_40(i)]= ABELES(l_fixed,d_40_air,n_air,deg2rad(theta(i)),polarization_tm);
    [r_45(i),t_45(i),R_45_air(i),T_45(i),A_45(i)]= ABELES(l_fixed,d_45_air,n_air,deg2rad(theta(i)),polarization_tm);
    [r_50(i),t_50(i),R_50_air(i),T_50(i),A_50(i)]= ABELES(l_fixed,d_50_air,n_air,deg2rad(theta(i)),polarization_tm);
    [r_55(i),t_55(i),R_55_air(i),T_55(i),A_55(i)]= ABELES(l_fixed,d_55_air,n_air,deg2rad(theta(i)),polarization_tm);
    
    [r_35(i),t_35(i),R_35_water(i),T_35(i),A_35(i)]= ABELES(l_fixed,d_35_water,n_water,deg2rad(theta(i)),polarization_tm);
    [r_40(i),t_40(i),R_40_water(i),T_40(i),A_40(i)]= ABELES(l_fixed,d_40_water,n_water,deg2rad(theta(i)),polarization_tm);
    [r_45(i),t_45(i),R_45_water(i),T_45(i),A_45(i)]= ABELES(l_fixed,d_45_water,n_water,deg2rad(theta(i)),polarization_tm);
    [r_50(i),t_50(i),R_50_water(i),T_50(i),A_50(i)]= ABELES(l_fixed,d_50_water,n_water,deg2rad(theta(i)),polarization_tm);
    [r_55(i),t_55(i),R_55_water(i),T_55(i),A_55(i)]= ABELES(l_fixed,d_55_water,n_water,deg2rad(theta(i)),polarization_tm);
end
figure;
plot(theta,R_35_air,theta,R_40_air,theta,R_45_air,theta,R_50_air,theta,R_55_air,'linewidth',2)
% ylim([0,1])
xlim([32 42])
grid on;
title('Reflection as function of incident angle at fixed wavelength of 632.8 nm and air as analyte')
xlabel('\Theta [deg]')
ylabel('Reflectivity')
legend('R-TM Ag thickness of 35 nm','R-TM Ag thickness of 40 nm','R-TM Ag thickness of 45 nm',...
    'R-TM Ag thickness of 50 nm', 'R-TM Ag thickness of 55 nm')
figure;
plot(theta,R_35_water,theta,R_40_water,theta,R_45_water,theta,R_50_water,theta,R_55_water,'linewidth',2)
% ylim([0,1])
xlim([45 65])
grid on;
title('Reflection as function of incident angle at fixed wavelength of 632.8 nm and water as analyte')
xlabel('\Theta [deg]')
ylabel('Reflectivity')
legend('R-TM Ag thickness of 35 nm','R-TM Ag thickness of 40 nm','R-TM Ag thickness of 45 nm',...
    'R-TM Ag thickness of 50 nm', 'R-TM Ag thickness of 55 nm')

%% _____Sensitiviy check_____
n3 = [n_p, n_Ag, n_w];
n4 = [n_p, n_Ag, n_w+0.015];
for i=1:length(theta)
    [r3(i),t1_1(i),R3(i),T3(i),A3(i)]= ABELES(l_fixed,d_50_water,n3,deg2rad(theta(i)),polarization_tm);
    [r4(i),t4(i),R4(i),T4(i),A4(i)]= ABELES(l_fixed,d_50_water,n4,deg2rad(theta(i)),polarization_tm);
end
figure;
plot(theta,R3,theta,R4)
% ylim([0,1])
xlim([45 65])
grid on;
title('Reflection as function of incident angle at fixed wavelength of 633 nm')
xlabel('\Theta [deg]')
ylabel('Reflectivity')
legend('R-TM3','R-TM4')

%% 