clc

clear

load ('.\data\xyz_bxbybz_bc1.mat');

X = xyz_bxbybz_bc1(:,1);
Y = xyz_bxbybz_bc1(:,2);

By = xyz_bxbybz_bc1(:,5);

X = reshape(X , 64 , 64 );

X = X';

Y = reshape(Y , 64 , 64 );

Y = Y';


By = reshape(By , 64 , 64 );

By = By';

%contour(X,Y,Bz)

%contour(X,Y,Bz,'ShowText','on')

contour(X,Y,By,25)
colorbar

 %title("X-Y-By " )