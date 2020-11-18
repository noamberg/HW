function [M]=Char_Mat(WaveMode,n_prism,lamda,d_layer,thita,n_layer)
% thita in degrees
% mu=1;% assuming non-magnetic media
d_layer=d_layer*1e-9;
thi_rad=(thita/180)*pi;
lamda_m=lamda*1e-9;% in meters
sin_thi_layer=(n_prism*sin(thi_rad))/n_layer;
costhi_layer=sqrt(1-(sin_thi_layer)^2);
K0=(2*pi)/lamda_m;
Beta=K0*n_layer*d_layer*costhi_layer;% rad
cosBeta=0.5*(exp(i*Beta)+exp(-i*Beta));% in rad
sinBeta=(-1/2*i)*(exp(i*Beta)-exp(-i*Beta));% in rad
if  WaveMode==1 % 1= TE mode
    q=n_layer*costhi_layer;% for  TM wave , epsilon=n2
 else % 2= TM mode
    q=(1/n_layer)*costhi_layer;
end
m11=cosBeta;
m12=(-1*i/q)*(sinBeta);
m21=-1*i*q*sinBeta;
m22=cosBeta;
M=[m11 m12; m21 m22];

