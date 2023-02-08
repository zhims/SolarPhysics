
clear 

load b3.mat

load bm.mat

  sum1 = 0;

for i = 1:262144
   sum1_tem1 =  b3(i,:) * bm(i,:)';

   sum1_tem2 = sqrt(b3(i,1)^2 + b3(i,2)^2 +  b3(i,3)^2);

   sum1_tem3 = sqrt(bm(i,1)^2 + bm(i,2)^2 +  bm(i,3)^2);

   sum1_tem4 = sum1_tem1/sum1_tem2/sum1_tem3;

   sum1 = sum1_tem4 + sum1;

   
end


C_cs = sum1/262144;

save('C_cs.mat','C_cs')