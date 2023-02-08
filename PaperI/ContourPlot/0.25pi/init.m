% YZhang
% Oct. 12, 2022

clc
clear


x0 = -1;
xt = 1;

y0 = -1;
yt = 1;

z0 = 0;
zt = 2;

N = 64;

x = x0 : 2/(N-1) : xt;
y = y0 : 2/(N-1) : yt;
z = z0 : 2/(N-1) : zt;

num = N^3;
points = zeros(num,3);

for k = 1:N
    for j = 1:N
        for i = 1:N
            tem = i +  (j-1)* N +  (k-1) * N * N;
            points(tem,:) = [x(i),y(j),z(k)];
        end
    end
end

bc1 = points(points(:,3)==0,:); % bottom
bc2 = points(points(:,1)==1,:); % face
bc3 = points(points(:,2)==1,:); % right
bc4 = points(points(:,1)==-1,:); % back of face 
bc5 = points(points(:,2)==-1,:); % left
bc6 = points(points(:,3)==2,:); % top

bc = [bc1;bc2;bc3;bc4;bc5;bc6];

save('.\data\points_all.mat','points')

save('.\data\points_bc.mat','bc1','bc2','bc3','bc4','bc5','bc6')

save('.\data\points_bc_all.mat','bc')

