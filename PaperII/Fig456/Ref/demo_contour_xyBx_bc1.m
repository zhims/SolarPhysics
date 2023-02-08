clc

clear

load ('.\data\xyz_bxbybz_bc1.mat');

X = xyz_bxbybz_bc1(:,1);
Y = xyz_bxbybz_bc1(:,2);

Bx = xyz_bxbybz_bc1(:,4);

X = reshape(X , 64 , 64 );

X = X';

Y = reshape(Y , 64 , 64 );

Y = Y';


Bx = reshape(Bx , 64 , 64 );

Bx = Bx';

%contour(X,Y,Bz)

%contour(X,Y,Bz,'ShowText','on')

contour(X,Y,Bx,50)
colorbar

 %title("X-Y-Bx " )