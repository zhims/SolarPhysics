clc

clear

load B.mat;

X = x_y_z_Bx_By_Bz(:,1);
Y = x_y_z_Bx_By_Bz(:,2);

Bz = x_y_z_Bx_By_Bz(:,6);

X = reshape(X , 64 , 64 );

X = X';

Y = reshape(Y , 64 , 64 );

Y = Y';


Bz = reshape(Bz , 64 , 64 );

Bz = Bz';



%load ('.\data\xyz_bxbybz_bc1.mat');
% 

%contour(X,Y,Bz)

%contour(X,Y,Bz,'ShowText','on')

contour(X,Y,Bz,50)
colorbar

 %title("X-Y-Bz " )