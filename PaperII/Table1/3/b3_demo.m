clear
load('B.mat')
b31 = reshape(Bx,64*64*64,1);
b32 = reshape(By,64*64*64,1);
b33 = reshape(Bz,64*64*64,1);
b3 = [b31 b32 b33]; 
save('b3.mat','b3')