% YZhang
% Oct. 13, 2022
clc
clear

%load points_bc.mat

load ('.\data\points_bc.mat')


[m_row,n_col] = size(bc1);

big_Phi = pi/2;
l = 0.3;

big_xyz = zeros(m_row,n_col);

trans_matrix1 = [cos(big_Phi),0,sin(big_Phi);0,1,0;-sin(big_Phi),0,cos(big_Phi)];

bc1_prime = zeros(m_row,n_col);

bc1_prime(:,1:2) =  bc1(:,1:2);
bc1_prime(:,3) =  bc1(:,3) + l;

for i = 1:m_row
    big_xyz(i,:) =bc1_prime(i,:) * trans_matrix1;
end

r_theta_phi_bc1  = zeros(m_row,n_col);

%r_theta_r_bc1  = zeros(m_row,1);
%r_theta_theta2mu_bc1  = zeros(m_row,1);

x_y_z_r_mu_phi_bc1 = zeros(m_row,6);
x_y_z_r_theta_phi_bc1 = zeros(m_row,6);


for i = 1:m_row

    tem1 = big_xyz(i,1)^2 + big_xyz(i,2)^2 + big_xyz(i,3)^2;
    tem2 = sqrt(tem1);

    tem3 = big_xyz(i,3)/tem2;

    tem4 = big_xyz(i,1)^2 + big_xyz(i,2)^2;
    tem5 = sqrt(tem4);
    tem6 = big_xyz(i,2)/tem5;
    tem7 = big_xyz(i,1)/tem5;

    if tem6 > 0
        tem8 = acos(tem7);
    else
       tem8 = 2* pi - acos(tem7);
    end


    r_theta_phi_bc1(i,1) = tem2;
    r_theta_phi_bc1(i,2) = acos(tem3);
    r_theta_phi_bc1(i,3) = tem8;

    %r_theta_r_bc1(i) = tem2;
    %r_theta_theta2mu_bc1(i) = tem3;

    x_y_z_r_mu_phi_bc1(i,4) = tem2;
    x_y_z_r_mu_phi_bc1(i,5) = tem3;
    x_y_z_r_mu_phi_bc1(i,6) = tem8;
end

x_y_z_r_mu_phi_bc1(:,1:3) = bc1;  % 


x_y_z_r_theta_phi_bc1(:,1:3) = bc1;      % 
x_y_z_r_theta_phi_bc1(:,4:6) = r_theta_phi_bc1;




save('.\data\x_y_z_r_mu_phi_bc1.mat','x_y_z_r_mu_phi_bc1')

save('.\data\x_y_z_r_theta_phi_bc1.mat','x_y_z_r_theta_phi_bc1')

%save('.\data\r_theta_phi_bc1.mat','r_theta_phi_bc1')

%save('.\data\r_bc1.mat','r_theta_r_bc1')
%save('.\data\mu_bc1.mat','r_theta_theta2mu_bc1')



