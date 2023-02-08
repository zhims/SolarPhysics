clc
clear

load ('.\data\x_y_z_r_theta_phi_B_bc1.mat');

theta = x_y_z_r_theta_phi_B_bc1(:,5);

phi = x_y_z_r_theta_phi_B_bc1(:,6);

Br = x_y_z_r_theta_phi_B_bc1(:,7);
 
Btheta = x_y_z_r_theta_phi_B_bc1(:,8);
 
Bphi = x_y_z_r_theta_phi_B_bc1(:,9);

[mrow,~] = size(theta);

bx_by_bz = zeros(mrow,3); 

for i = 1: mrow
    bx_by_bz(i,:) = vec_com_trans(theta(i),phi(i),Br(i),Btheta(i),Bphi(i));
end

xyz_bxbybz_bc1 = [x_y_z_r_theta_phi_B_bc1(:,1:3),bx_by_bz];
 
save('.\data\xyz_bxbybz_bc1.mat','xyz_bxbybz_bc1');