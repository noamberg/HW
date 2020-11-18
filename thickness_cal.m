% Thickness calculater
A = 1 / (2 * pi);
n_s = 1.5; n_0 = 1; n_1 = 2.5; n_2 = 1.5;
B_up = ( n_s - n_0 ) * ( n_0*n_s - n_1^2 ) * n_2^2;
B_down = ((n_s^2)*n_s - n_0*(n_s^2))*( (n_s^2) - n_0*n_s );
C = atan(sqrt(abs(B_up/B_down))) / A;
lambda = 600;
d_2 = C * lambda / n_2