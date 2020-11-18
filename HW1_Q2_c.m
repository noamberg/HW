%% Q2 c 380 nm to 750 nm
clc;clear;close all;
l=1:1:800;%nm
n_new=[2.5,1.5];
rep_n=repmat(n_new,1,5);
d_new=[55,80];
rep_d=repmat(d_new,1,5);
d=[NaN,rep_d,rep_d,rep_d,rep_d,rep_d]; %nm
n=[1,rep_n,rep_n,rep_n,rep_n,rep_n];% layers refractive index
t0_deg=0;% angle of inc
t0=pi*t0_deg/180; %angle in radians
polarization_te=0; %for the calc function
polarization_tm=1;
t0_vec=(1:90); %just a vector for the graph plot
for i=1:800
    [r_te(i),t_te(i),R_te(i),T_te(i),A_te(i)]=ABELES(l(i),d,n,t0,polarization_te);
    [r_tm(i),t_tm(i),R_tm(i),T_tm(i),A_tm(i)]=ABELES(l(i),d,n,t0,polarization_tm);
end
lambda_reflected=find(R_te==max(R_te))
figure;
% subplot(2,1,1)
plot(l,R_te,l,R_tm)
grid on
xlim([400 800])
title('Reflection when the blocks are placed continuously')
legend('Rte-50','Rtm-50')
text(635,0.9,'\uparrow')
text(580,0.8, '\lambda=2(n1*d1+n2*d2)=635 nm')
grid on
