%% HW 3 Q6 Tom Lev-ron IOE course
% a section (prism => Silver => Gold => analyte)
clc;clear;close all;
l_fixed = 633; %nm 
d = [NaN,20,30,inf];
n1=1; nprism=1.7786; n3=1.33; %water
conv_coef=1239.8424; %Conversion coefficent for the eV units
wavelengths=1:1:800;
x=1:1:800;
x=x/1000;
nprism=sqrt(1+1.73759695./(1-0.013188707./x.^2)+0.313747346./(1-0.0623068142./x.^2)+1.89878101./(1-155.23629./x.^2));
% plot(nprism(370:800))
% Par for Ag (Silver) in [eV]
f0_Ag=0.845;
gamma0_Ag=0.048;
Wp_Ag=9.01; %Plasma freq
f_Ag=[0.065,0.124,0.011,0.840];% f1,f2,f3 ....
W_Ag=[0.816,4.481,8.185,9.083]; %w1,w2....
gamma_Ag=[3.886,0.452,0.065,0.916];% Gamma

% Par for Gold (Au) 
f0_Au=0.76;
gamma0_Au=0.053;
Wp_Au=9.03; %Plasma freq
f_Au=[0.024,0.01,0.071,0.601];% f1,f2,f3 ....
W_Au=[0.415,0.83,2.969,4.304]; %w1,w2....
gamma_Au=[0.241,0.345,0.87,2.494];

epsilon_1_Ag=zeros(1,wavelengths(end));
epsilon_Ag=epsilon_1_Ag;
for k1=wavelengths
    w=conv_coef/k1;
    epsilon_1_Ag(k1)=1-f0_Ag*Wp_Ag^2/(w*(w-1i*gamma0_Ag));
    epsilon_Ag(k1)=epsilon_1_Ag(k1)+(f_Ag.*Wp_Ag^2)*(1./(W_Ag.^2-w^2+1i*w*gamma_Ag)');
    epsilon_1_Au(k1)=1-f0_Au*Wp_Au^2/(w*(w-1i*gamma0_Au));
    epsilon_Au(k1)=epsilon_1_Au(k1)+(f_Au.*Wp_Au^2)*(1./(W_Au.^2-w^2+1i*w*gamma_Au)');
end
n_Ag=(epsilon_Ag).^0.5;
n_Au=(epsilon_Au).^0.5;
n = [nprism(633),n_Ag(633),n_Au(633),n3];
polarization_te = 0; polarization_tm = 1;
nair = 1;
d0 = 1:91;
theta1 = deg2rad( [ 0 , d0(1:end-1) ] );
theta2 = asin( ( sin(theta1) / nprism(633) ) ); %snell law
theta3 = deg2rad(60) - theta2; %geometry

for i=1:91
    [r1(i),t1(i),R1(i),T1(i),A1(i)]= ABELES(l_fixed,d,n,theta3(i),polarization_te);
    [r2(i),t2(i),R2(i),T2(i),A2(i)]= ABELES(l_fixed,d,n,theta3(i),polarization_tm);
end
figure;
plot(rad2deg(theta3),R1,rad2deg(theta3),R2)
ylim([0,1])
% xlim([40 60])
grid on;
title('Reflection as function of incident angle at fixed wavelength of 633 nm')
xlabel('\Theta [deg]')
ylabel('Reflectivity')
legend('R-TE','R-TM')
% -------------b------------ 53

lambda=1:1:799;
for i=1:799
    n = [nprism(i),n_Ag(i),n_Au(i),n3];
    [r1_l(i),t1_l(i),R1_l(i),T1_l(i),A1_l(i)]= ABELES(lambda(i),d,n,deg2rad(53.84),polarization_te);
    [r2_l(i),t2_l(i),R2_l(i),T2_l(i),A2_l(i)]= ABELES(lambda(i),d,n,deg2rad(53.84),polarization_tm);
end
figure;
plot(lambda,R1_l,lambda,R2_l)
legend('R-TE','R-TM')
ylim([0,1])
xlim([370 800])
grid on;
title(['Reflectence as function of wavelength at fixed angle of: ',num2str(53.84),'°'])
ylabel('Reflectivity')
xlabel('wavelength [nm]')
% C realtion between the angles:
figure;
plot(rad2deg(theta1),rad2deg(theta3))
title('Relation between the internal angle in the prism and the external one in air')
xlabel('External angle \Theta [deg]')
ylabel('Intrnal angle \Theta [deg]')
grid on
%% Sense script!!!!!!
clc;clear;close all;
l_fixed = 633; %nm 
d = [NaN,20,30,inf];
n1=1; nprism=1.7786; n3=1.33;n4=1.34; %water
conv_coef=1239.8424; %Conversion coefficent for the eV units
wavelengths=1:1:800;
x=1:1:800;
x=x/1000;
nprism=sqrt(1+1.73759695./(1-0.013188707./x.^2)+0.313747346./(1-0.0623068142./x.^2)+1.89878101./(1-155.23629./x.^2));
% plot(nprism(370:800))
% Par for Ag (Silver) in [eV]
f0_Ag=0.845;
gamma0_Ag=0.048;
Wp_Ag=9.01; %Plasma freq
f_Ag=[0.065,0.124,0.011,0.840];% f1,f2,f3 ....
W_Ag=[0.816,4.481,8.185,9.083]; %w1,w2....
gamma_Ag=[3.886,0.452,0.065,0.916];% Gamma

% Par for Gold (Au) 
f0_Au=0.76;
gamma0_Au=0.053;
Wp_Au=9.03; %Plasma freq
f_Au=[0.024,0.01,0.071,0.601];% f1,f2,f3 ....
W_Au=[0.415,0.83,2.969,4.304]; %w1,w2....
gamma_Au=[0.241,0.345,0.87,2.494];

epsilon_1_Ag=zeros(1,wavelengths(end));
epsilon_Ag=epsilon_1_Ag;
for k1=wavelengths
    w=conv_coef/k1;
    epsilon_1_Ag(k1)=1-f0_Ag*Wp_Ag^2/(w*(w-1i*gamma0_Ag));
    epsilon_Ag(k1)=epsilon_1_Ag(k1)+(f_Ag.*Wp_Ag^2)*(1./(W_Ag.^2-w^2+1i*w*gamma_Ag)');
    epsilon_1_Au(k1)=1-f0_Au*Wp_Au^2/(w*(w-1i*gamma0_Au));
    epsilon_Au(k1)=epsilon_1_Au(k1)+(f_Au.*Wp_Au^2)*(1./(W_Au.^2-w^2+1i*w*gamma_Au)');
end
n_Ag=(epsilon_Ag).^0.5;
n_Au=(epsilon_Au).^0.5;
n = [nprism(633),n_Ag(633),n_Au(633),n3];
n_new = [nprism(633),n_Ag(633),n_Au(633),n4];
polarization_te = 0; polarization_tm = 1;
nair = 1;
d0 = 1:91;
theta1 = deg2rad( [ 0 , d0(1:end-1) ] );
theta2 = asin( ( sin(theta1) / nprism(633) ) ); %snell law
theta3 = deg2rad(60) - theta2; %geometry

for i=1:91
    [r1(i),t1(i),R1(i),T1(i),A1(i)]= ABELES(l_fixed,d,n,theta3(i),polarization_te);
    [r2(i),t2(i),R2(i),T2(i),A2(i)]= ABELES(l_fixed,d,n,theta3(i),polarization_tm);
    [r1_new(i),t1_new(i),R1_new(i),T1_new(i),A1_new(i)]= ABELES(l_fixed,d,n_new,theta3(i),polarization_te);
    [r2_new(i),t2_new(i),R2_new(i),T2_new(i),A2_new(i)]= ABELES(l_fixed,d,n_new,theta3(i),polarization_tm);
end
figure;
theta1_new=asin(nprism(633)*sin(deg2rad(60)-deg2rad(53.84)));
plot(rad2deg(theta1),R1,rad2deg(theta1),R2,rad2deg(theta1),R1_new,rad2deg(theta1),R2_new)
ylim([0,1])
% xlim([40 60])
grid on;
title({'Reflection as function of incident angle at fixed wavelength of 633 nm'...
    ;' Two diffrent refractive indexes'})
text(-5,0.063,'9 [deg]\rightarrow ')
text(15,0.05,'\leftarrow 11 [deg] ')
xlabel('\Theta [deg]')
ylabel('Reflectivity')
legend('R-TE n=1.33','R-TM n=1.33','R-TE n-water=1.34','R-TM n-water=1.34')
% -------------b------------ 53

lambda=1:1:799;
for i=1:799
    n = [nprism(i),n_Ag(i),n_Au(i),n3];
    n_new= [nprism(i),n_Ag(i),n_Au(i),n4];
    [r1_l(i),t1_l(i),R1_l(i),T1_l(i),A1_l(i)]= ABELES(lambda(i),d,n,deg2rad(53.84),polarization_te);
    [r2_l(i),t2_l(i),R2_l(i),T2_l(i),A2_l(i)]= ABELES(lambda(i),d,n,deg2rad(53.84),polarization_tm);
    [r1_l_new(i),t1_l_new(i),R1_l_new(i),T1_l_new(i),A1_l_new(i)]= ABELES(lambda(i),d,n_new,deg2rad(54.95),polarization_te);
    [r2_l_new(i),t2_l_new(i),R2_l_new(i),T2_l_new(i),A2_l_new(i)]= ABELES(lambda(i),d,n_new,deg2rad(54.95),polarization_tm);
end
figure;
plot(lambda,R1_l,lambda,R2_l,lambda,R1_l_new,lambda,R2_l_new)
legend('R-TE n-water=1.33','R-TM n-water=1.33','R-TE n-water=1.34','R-TM n-water=1.34')
text(500,0.03,'n=1.34 at 627 nm\rightarrow ')
text(655,0.03,'\leftarrow n=1.33 at 643 nm')
ylim([0,1])
xlim([370 800])
grid on;
title({'Reflectence as function of wavelength at fixed angle at resonance'...
    ;' Two diffrent refractive indexes'})
ylabel('Reflectivity')
xlabel('wavelength [nm]')


min_R2_l=min(R2_l(600:799));
min_R2_l_new=min(R2_l_new(600:799));
index_min_R2_l=find(R2_l==min_R2_l);
index_min_R2_l_new=find(R2_l_new==min_R2_l_new);
sensitivity_l=abs((index_min_R2_l_new-index_min_R2_l)/(n4-n3))

min_R2=min(R2);
min_R2_new=min(R2_new);
index_min_R2=find(R2==min_R2)-1;
index_min_R2_new=find(R2_new==min_R2_new)-1;
sensitivity_angle=abs((index_min_R2_new-index_min_R2)/(n4-n3))
sensitivity_angle_prism=(54.95-53.84)/(n4-n3)
figure;
plot(rad2deg(theta1),rad2deg(theta3))
title('Relation between the internal angle in the prism and the external one in air')
xlabel('External angle')
ylabel('Intrnal angle')