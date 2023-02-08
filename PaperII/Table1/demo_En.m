
clear 

load b3.mat

load bm.mat


sum1 = 0;
for i = 1:262144
   sum1_tem1 =  bm(i,1)^2 + bm(i,2)^2 + bm(i,3)^2 ;
   sum1_tem2 = sqrt(sum1_tem1);
   sum1 = sum1 + sum1_tem2;
   
end


sum2 =0;
for i = 1:262144
   sum2_tem1 =  b3(i,:) -  bm(i,:);
   sum2_tem2 = sum2_tem1(1)^2 + sum2_tem1(2)^2 + sum2_tem1(3)^2;
   sum2_tem3 = sqrt(sum2_tem2);
   sum2_tem4 = sum2_tem3/sum1;

   sum2 =  sum2 + sum2_tem4 ;
 
end


En = 1 - sum2;

save('En.mat','En')