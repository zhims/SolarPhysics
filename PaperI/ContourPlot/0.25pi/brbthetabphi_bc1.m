

% load h.mat
% 
% mu_tem = mu +1;
% 
% n_tem = floor(mu_tem/h);
% 
% n_tem_pos = n_tem + 1;
% 
% 
% load data_test.mat
% 
% 
% F = F_test(n_tem_pos);
% Fprime = F_prime_test(n_tem_pos);




clc
clear

load ('.\data\x_y_z_r_mu_phi_bc1.mat')

load ('.\data\x_y_z_r_theta_phi_bc1.mat')

load  para_test.mat

a = sqrt(0.427405527444639);


r = x_y_z_r_mu_phi_bc1(:,4)';
mu = x_y_z_r_mu_phi_bc1(:,5)';

r = dlarray(r,"CB");

mu = dlarray(mu,"CB");


F_Fprime = model(parameters,mu);

F = extractdata(F_Fprime(1,:));

Fprime = extractdata(F_Fprime(2,:));

temp1 = sqrt(1 - mu.^2);

B_r = - r .^ -3 .* Fprime;
B_theta = r .^ -3 ./ temp1 .* F;
B_phi =  r .^ -3 ./ temp1 * a .* F .^2;

B_r = extractdata(B_r)';
B_theta = extractdata(B_theta)';
B_phi = extractdata(B_phi)';

B = [B_r, B_theta, B_phi];

x_y_z_r_mu_phi_B_bc1 = [x_y_z_r_mu_phi_bc1,B];

x_y_z_r_theta_phi_B_bc1 = [x_y_z_r_theta_phi_bc1,B];

save('.\data\x_y_z_r_mu_phi_B_bc1.mat','x_y_z_r_mu_phi_B_bc1');

save('.\data\x_y_z_r_theta_phi_B_bc1.mat','x_y_z_r_theta_phi_B_bc1');



