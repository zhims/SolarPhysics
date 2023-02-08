clc

clear

load B.mat;

X = x_y_z_Bx_By_Bz(:,1);
Y = x_y_z_Bx_By_Bz(:,2);

By = x_y_z_Bx_By_Bz(:,5);

X = reshape(X , 64 , 64 );

X = X';

Y = reshape(Y , 64 , 64 );

Y = Y';


By = reshape(By , 64 , 64 );

By = By';



%load ('.\data\xyz_bxbybz_bc1.mat');
% 

%contour(X,Y,Bz)

%contour(X,Y,Bz,'ShowText','on')

contour(X,Y,By,50)
colorbar

 %title("X-Y-By " )