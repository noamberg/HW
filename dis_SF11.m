

function [np_SF11]=dis_SF11(lamda_nm) 

C1 = 1.73759695; C2 = 0.013188707; C3 = 0.313747346; C4 = 0.0623068142; C5 = 1.89878101; C6 = 155.23629;
lamda_micron=lamda_nm*1e-3 ; 
epsilon_p_SF11=1+(C1*lamda_micron^2)/(lamda_micron^2-C2)+(C3*lamda_micron^2)/(lamda_micron^2-C4)+(C5*lamda_micron^2)/(lamda_micron^2-C6) ;
np_SF11=sqrt(epsilon_p_SF11) ;

