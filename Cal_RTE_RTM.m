function [Reflectivity, Transmissivity ,r]=Cal_RTE_RTM(d_layers,n_layers,lamda,np,thita,n_analyte)
% R ,T,r [TE TM]
Mtotal_TE=[1 0;0 1]; Mtotal_TM=[1 0;0 1];
d=d_layers;
n_prism=np;
na=n_analyte;
WaveMode=1; % TE mode
for i=1:length(d)
    [M]=Char_Mat(WaveMode,n_prism,lamda,d(i),thita,n_layers(i));
    Mtotal_TE=Mtotal_TE*M;
end
WaveMode=2; % TM mode
for i=1:length(d)
    [M]=Char_Mat(WaveMode,n_prism,lamda,d(i),thita,n_layers(i));
    Mtotal_TM=Mtotal_TM*M;
end
%%%%%%%%%%%%%%% Reflectivity&Transmissivity for TE & TM mode %%%%%%%%%

thi_rad=(thita/180)*pi;  sinthi=sin(thi_rad);  costhi=sqrt(1-sinthi^2);% thita in the prism medium
p_first=[n_prism*costhi (1/n_prism)*costhi];%[ P1_TEwave P1_TMwave ]
sinthi_t=(n_prism/na)*sinthi;% thita transmite in the analyte medium
costhi_t=sqrt(1-(sinthi_t)^2);
p_last=[na*costhi_t (1/na)*costhi_t];% [ PL_TEwave ;PL_TMwave ]
Total_M={Mtotal_TE,Mtotal_TM}; Reflectivity=zeros(2,1);% [RTE ;RTM]
Transmissivity=zeros(2,1);%[TTE TTM]
r=zeros(2,1);
for i=1:2
    M_TE=Total_M{1,i};
    R=(M_TE(1,1)+M_TE(1,2)*p_last(i))*p_first(i)-(M_TE(2,1)+M_TE(2,2)*p_last(i));
    A=(M_TE(1,1)+M_TE(1,2)*p_last(i))*p_first(i)+(M_TE(2,1)+M_TE(2,2)*p_last(i));
    r(i)=R/A;
    T=2*p_first(i);
    t=T/A;
    Reflectivity(i)=abs(r(i))^2;
    Transmissivity(i)=(p_last(i)/p_first(i))*abs(t)^2;
end