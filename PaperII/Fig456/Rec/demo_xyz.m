% YZhang
% Jan. 29, 2023
clc
clear

%load points_bc.mat

load ('.\data\points_bc.mat')

load parameters.mat


[m_row,n_col] = size(bc1);


% X1 = zeros(m_row,1);
% Y1 = zeros(m_row,1);
% Z1 = zeros(m_row,1);
% 
% Bx = zeros(m_row,1);
% By = zeros(m_row,1);
% Bz = zeros(m_row,1);

x_y_z_Bx_By_Bz = zeros(m_row,6);

for i = 1:m_row
    x = dlarray(bc1(i,1),"CB");
    y = dlarray(bc1(i,2),"CB");
    z = dlarray(bc1(i,3),"CB");
    Bx_By_Bz = model(parameters,x,y,z);

    x_y_z_Bx_By_Bz(i,1) = x;
    x_y_z_Bx_By_Bz(i,2) = y;
    x_y_z_Bx_By_Bz(i,3) = z;

    x_y_z_Bx_By_Bz(i,4) = Bx_By_Bz(1);
    x_y_z_Bx_By_Bz(i,5) = Bx_By_Bz(2);
    x_y_z_Bx_By_Bz(i,6) = Bx_By_Bz(3);

end

save('B.mat','x_y_z_Bx_By_Bz')