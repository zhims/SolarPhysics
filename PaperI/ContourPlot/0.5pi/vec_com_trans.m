
% YZhang
% Oct. 14, 2022

function vec_B = vec_com_trans(theta,phi,Br,Btheta,Bphi)

big_Phi =  pi/2;

a11 = cos(big_Phi) * sin(theta) * cos(phi) + sin(big_Phi) * cos(theta);
a12 = sin(theta) * sin(phi);
a13 = -sin(big_Phi) * sin(theta) * cos(phi) + cos(big_Phi) * cos(theta);
a21 = cos(big_Phi) * cos(theta) * cos(phi) - sin(big_Phi) * sin(theta);
a22 = cos(theta) * sin(phi);
a23 = -sin(big_Phi) * cos(theta) * cos(phi) - cos(big_Phi) * sin(theta);
a31 = -cos(big_Phi) * sin(phi);
a32 = cos(phi);
a33 = sin(big_Phi) * sin(phi);


A = [a11, a12, a13; a21, a22, a23; a31, a32, a33];

vec_B = [Br, Btheta, Bphi] * A;