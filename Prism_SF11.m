function [n_prism] = Prism_SF11(lambda_nm)
%This function calculate the refractive index of SF 11 prism
%   [n_prismp] = Prism_SF11(lambda)
% lambda_nm = the fixed wavelength that hit the prism in nm (also can be a
% vector)

C1 = 1.73759695; C2 = 0.013188707;
C3 = 0.313747346; C4 = 0.0623068142;
C5 = 1.89878101; C6 = 155.23629;

lambda_micron=lambda_nm*1e-3 ;

if size(lambda_nm,2) == 1
    epsilon_p_SF11=1+(C1*lambda_micron^2)/(lambda_micron^2-C2)+(C3*lambda_micron^2)/(lambda_micron^2-C4)+(C5*lambda_micron^2)/(lambda_micron^2-C6) ;
    n_prism=sqrt(epsilon_p_SF11) ;
else
    x = lambda_micron;
    n_prism=sqrt(1+1.73759695./(1-0.013188707./x.^2)+0.313747346./(1-0.0623068142./x.^2)+1.89878101./(1-155.23629./x.^2));
end

end

