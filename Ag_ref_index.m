function [n_Ag] = Ag_ref_index(lambda)
%Epsilon_Ag function calculate the epsilon of silver (Ag) based on
%the fitting values in the paper : 1998  Vol. 37, No. 22  APPLIED OPTICS
%   Detailed explanation goes here

Wp_Ag=9.01 ; f0_Ag=0.845 ; gammma0_Ag=0.048 ;
f_1=0.065  ; gama_1=3.886   ;   omega_1=0.816  ;
f_2=0.124  ; gama_2=0.452   ;   omega_2=4.481  ;
f_3=0.011  ; gama_3=0.065   ;   omega_3=8.185  ;
f_4=0.840  ; gama_4=0.916   ;   omega_4=9.083  ;
f_5=5.646  ; gama_5=2.419   ;   omega_5=20.29  ;

conv_coef=1239.8424; %Conversion coefficent for the eV units
w=conv_coef/lambda;

epsilon=1-((f0_Ag*Wp_Ag^2)/(w*(w-1i*gammma0_Ag)))...
    +(f_1*Wp_Ag^2)/((omega_1^2-w^2)+1i*w*gama_1)...
    +(f_2*Wp_Ag^2)/((omega_2^2-w^2)+1i*w*gama_2)...
    +(f_3*Wp_Ag^2)/((omega_3^2-w^2)+1i*w*gama_3)...
    +(f_4*Wp_Ag^2)/((omega_4^2-w^2)+1i*w*gama_4)...
    +(f_5*Wp_Ag^2)/((omega_5^2-w^2)+1i*w*gama_5) ;

n_Ag = (sqrt(epsilon))';

end

