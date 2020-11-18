
% This function consider the fitting values in the paper : 1998  Vol. 37, No. 22  APPLIED OPTICS


function [n_silver]=dis_silver_Rakic_paper(lamda) 

lamda=lamda*1e-9 ;  
wlmicron=lamda*1e6;
omega=1.2398424/wlmicron; 
 
 omega_p=9.01 ; f_0=0.845 ; gama_0=0.048 ; 
 f_1=0.065  ; gama_1=3.886   ;   omega_1=0.816  ; 
 f_2=0.124  ; gama_2=0.452   ;   omega_2=4.481  ; 
 f_3=0.011  ; gama_3=0.065   ;   omega_3=8.185  ; 
 f_4=0.840  ; gama_4=0.916   ;   omega_4=9.083  ; 
 f_5=5.646  ; gama_5=2.419   ;   omega_5=20.29  ;
 
 epsilon=1-((f_0*omega_p^2)/(omega*(omega-1i*gama_0)))...
     +(f_1*omega_p^2)/((omega_1^2-omega^2)+1i*omega*gama_1)...
     +(f_2*omega_p^2)/((omega_2^2-omega^2)+1i*omega*gama_2)...
     +(f_3*omega_p^2)/((omega_3^2-omega^2)+1i*omega*gama_3)...
     +(f_4*omega_p^2)/((omega_4^2-omega^2)+1i*omega*gama_4)...
     +(f_5*omega_p^2)/((omega_5^2-omega^2)+1i*omega*gama_5) ;
 
  n_silver=(sqrt(epsilon))' ;         
            
    