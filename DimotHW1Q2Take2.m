%A periodic structure where each unit cell contains two layers operate as a narrow band spectral filter.
%different wave length and fixed angle of 45 degs

clc;
clear;
close all;

t0 = deg2rad(0); %Incident angle

Nbig3=50;   %Number of stack (50)

Msbig3=2*Nbig3+2;   %(number of mediums for N=50)

MIN=300; %min wave length in (nm)
MAX=900; %max wave length in (nm)
l = MIN:1:MAX-1;%creating vector of wave length
D(1)=inf; %Thicknesses of the enter medium
D(2)=67.0078;%Thicknesses of the 1st medium in the period
D(3)=91.241;%Thicknesses of the 2st medium
%N(1)=1; N(2)=1.47; N(3)=1.96; %index of refraction of the enter, 1st, and 2nd medium


%calculate the refarctive index vectors for the different wavelength
%1st layer - Si3N4 (high index), 2nd layer - glass BK7 (low index)
for t=1:1:MAX-MIN
    N1(t)=1;
    N2(t)=[1+[(3.0249*((l(t)/1000))^2)/((l(t)/1000)^2-0.1353406^2)]+[(40314*(l(t)/1000)^2)/((l(t))^2-1239.842^2)]]^0.5;
    N3(t)=[1+[(1.03961212*(l(t)/1000)^2)/((l(t)/1000)^2-0.00600069867^2)]+[(0.231792344*(l(t)/1000)^2)/((l(t)/1000)^2-0.0200179144^2)]+[(1.01046945*(l(t)/1000)^2)/((l(t)/1000)^2-103.5606563^2)]]^0.5;
    
    
    dbig3(1)=D(1);
    nbig3(1)=N1(1);
    dbig3(Msbig3)=D(1);
    nbig3(Msbig3)=N1(t);
    
    for k=1:1:(Msbig3-2)    %Creating vector of refarction index for N=50 periods
        q=rem(k,2);
        if (q==0)
            dbig3(k+1)=D(3);
            nbig3(k+1)=N3(t);
        else
            dbig3(k+1)=D(2);
            nbig3(k+1)=N2(t);
        end
    end
    
    polarization = 0;   %Calculating the reflectivity and transmition using abeles function for N=50
    [r1big3(t),t1big3(t),R1big3(t),T1big3(t),A1big3(t)]= jreftran_rt(l(t),dbig3,nbig3,t0,polarization);
end


plot(l,R1big3)
ylim([0,1])
xlim([MIN,MAX])
grid on;
title('Reflectivity VS \lambda {nm} for N=50')
xlabel('\lambda {nm}')
ylabel('')
legend('R-TE')

