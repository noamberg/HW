clc;
clear;
close all;

EMIN = 0.65;
EMAX = 6;
E = EMIN:0.01:EMAX;%%Photon energy in eV units
Eg = 1.06;
Lambda = E;
A1 = 0.00405; A2 = 0.01427; A3 = 0.0683; A4 = 0.17488;

B1 = 6.885; B2 = 7.401; B3 = 8.634; B4 = 10.652;

C1 = 11.864; C2 = 13.754; C3 = 18.812; C4 = 29.841;

Ninf = 1.95;

Q1 = (C1-((B1^2)/4))^0.5;
D1tag = -(A1*B1)/(2*Q1);
F1tag = (A1*C1)/Q1;
D1 = (A1/Q1)*(Eg-(B1/2));
F1 = (A1/Q1)*(C1-(Eg*B1)/2);

Q2 = (C2-((B2^2)/4))^0.5;
D2tag = -(A2*B2)/(2*Q2);
F2tag = (A2*C2)/Q2;
D2 = (A2/Q2)*(Eg-(B2/2));
F2 = (A2/Q2)*(C2-(Eg*B2)/2);

Q3 = (C3-((B3^2)/4))^0.5;
D3tag = -(A3*B3)/(2*Q3);
F3tag = (A3*C3)/Q3;
D3 = (A3/Q3)*(Eg-(B3/2));
F3 = (A3/Q3)*(C3-(Eg*B3)/2);

Q4 = (C4-((B4^2)/4))^0.5;
D4tag = -(A4*B4)/(2*Q4);
F4tag = (A4*C4)/Q4;
D4 = (A4/Q4)*(Eg-(B4/2));
F4 = (A4/Q4)*(C4-(Eg*B4)/2);
Thetai = deg2rad(70.79);

for i=1:1:length(E)
    K(i) = (A1*E(i))/((E(i)^2-B1*E(i)+C1)) + (A1*(E(i)-Eg))/((E(i)^2-B1*E(i)+C1)) + (A2*E(i))/((E(i)^2-B2*E(i)+C2)) + (A2*(E(i)-Eg))/((E(i)^2-B2*E(i)+C2)) + (A3*E(i))/((E(i)^2-B3*E(i)+C3)) + (A3*(E(i)-Eg))/((E(i)^2-B3*E(i)+C3)) + (A4*E(i))/((E(i)^2-B4*E(i)+C4)) + (A4*(E(i)-Eg))/((E(i)^2-B4*E(i)+C4));
    N(i) = Ninf + (D1tag*E(i)+F1tag)/((E(i)^2-B1*E(i)+C1)) + (D1*E(i)+F1)/((E(i)^2-B1*E(i)+C1)) + (D2tag*E(i)+F2tag)/((E(i)^2-B2*E(i)+C2)) + (D2*E(i)+F2)/((E(i)^2-B2*E(i)+C2)) + (D3tag*E(i)+F3tag)/((E(i)^2-B3*E(i)+C3)) + (D3*E(i)+F3)/((E(i)^2-B3*E(i)+C3)) + (D4tag*E(i)+F4tag)/((E(i)^2-B4*E(i)+C4)) + (D4*E(i)+F4)/((E(i)^2-B4*E(i)+C4));
    %Lambda(length(E)+1-i)=1239.8/E(i);
    Lambda(i)=1239.8/E(i);
    %K(i) = K(i)^0.5;
    %N(i) = N(i)^0.5;
    
    n(i) = (K(i)^2+N(i)^2)^0.5;     %%Loop for normal incident angle
    Rp(i) = ((n(i)-1)/(n(i)+1))^2;
    Tp(i) = 1-Rp(i);
    Rs(i) = ((1-n(i))/(1+n(i)))^2;
    Ts(i) = 1-Rs(i);
    
    Thetat(i) = (asin((1/n(i)*sin(Thetai)))); %%Loop for Brewster incident angle 
    Rp1(i) = ((n(i)*cos(Thetai)-1*cos(Thetat(i)))/(n(i)*cos(Thetai)+cos(Thetat(i))))^2;
    Tp1(i) = 1-Rp(i);
    Rs1(i) = ((cos(Thetai)-n(i)*cos(Thetat(i)))/(cos(Thetai)+n(i)*cos(Thetat(i))))^2;
    Ts1(i) = 1-Rs(i);
    
end

LambdaMAX=Lambda(1);
LambdaMIN=Lambda(end);

figure;
subplot(1,2,1);
plot(E,K,E,N)
xlabel('Photon energy (eV)');
legend('K','N')
grid on;
xlim([EMIN,EMAX]);
title('Refractive index Real and Imagenery parts VS Photon energy (eV) - Forouhi-Bloomer model')
hold on

subplot(1,2,2);
plot(Lambda,K,Lambda,N)
xlabel('Lambda(nm)');
legend('K(\lambda)','N(\lambda)')
grid on;
xlim([LambdaMIN,LambdaMAX]);
title('Refractive index Real and Imagenery parts VS \lambda (nm) - Forouhi-Bloomer model')

figure;
subplot(1,2,1);
plot(Lambda,Rp,Lambda,Tp)
xlabel('Lambda(nm)');
legend('Rp','Tp')
grid on;
xlim([LambdaMIN,LambdaMAX]);
title('Reflectivity and Trasmitance VS \lambda (nm) at normal incident angle for P polarizations')

subplot(1,2,2);
plot(Lambda,Rs,Lambda,Ts)
xlabel('Lambda(nm)');
legend('Rs','Ts')
grid on;
xlim([LambdaMIN,LambdaMAX]);
title('Reflectivity and Trasmitance VS \lambda (nm) at normal incident angle for S polarizations')

figure;
subplot(1,2,1);
plot(Lambda,Rs1,Lambda,Ts1)
xlabel('Lambda(nm)');
legend('Rs','Ts')
grid on;
xlim([LambdaMIN,LambdaMAX]);
title('Reflectivity and Trasmitance VS \lambda (nm) at Brewster incident angle for S polarizations')

subplot(1,2,2);
plot(Lambda,Rp1,Lambda,Tp1)
xlabel('Lambda(nm)');
legend('Rp','Tp')
grid on;
xlim([LambdaMIN,LambdaMAX]);
title('Reflectivity and Trasmitance VS \lambda (nm) at Brewster incident angle for P polarizations')
