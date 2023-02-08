clear

load B.mat

x0 = -1;
xt = 1;

y0 = -1;
yt = 1;


N =  16;

x = x0 : 2/(N-1) : xt;
y = y0 : 2/(N-1) : yt;
z = 0;

%[X,Y,Z] = meshgrid(x,y,z);

[startX,startY,startZ] = meshgrid(x,y,z);

verts = stream3(X,Y,Z,Bx,By,Bz,startX,startY,startZ);

lineobj = streamline(verts);
view(3)

%zlim([0 1])

xlabel('x');
ylabel('y');
zlabel('z');