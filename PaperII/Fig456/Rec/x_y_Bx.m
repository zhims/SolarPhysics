clc

clear

load B.mat;

X = x_y_z_Bx_By_Bz(:,1);
Y = x_y_z_Bx_By_Bz(:,2);

Bx = x_y_z_Bx_By_Bz(:,4);

X = reshape(X , 64 , 64 );

X = X';

Y = reshape(Y , 64 , 64 );

Y = Y';


Bx = reshape(Bx , 64 , 64 );

Bx = Bx';



%load ('.\data\xyz_bxbybz_bc1.mat');
% 

%contour(X,Y,Bz)

%contour(X,Y,Bz,'ShowText','on')

contour(X,Y,Bx,50)
colorbar

 %title("X-Y-Bx " )