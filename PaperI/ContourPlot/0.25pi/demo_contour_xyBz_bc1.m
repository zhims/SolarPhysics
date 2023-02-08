clc

clear

load ('.\data\xyz_bxbybz_bc1.mat');

X = xyz_bxbybz_bc1(:,1);
Y = xyz_bxbybz_bc1(:,2);

Bz = xyz_bxbybz_bc1(:,6);

X = reshape(X , 64 , 64 );

X = X';

Y = reshape(Y , 64 , 64 );

Y = Y';


Bz = reshape(Bz , 64 , 64 );

Bz = Bz';

%contour(X,Y,Bz)

%contour(X,Y,Bz,'ShowText','on')

contour(X,Y,Bz,25)
colorbar

% title("X-Y-Bz" )