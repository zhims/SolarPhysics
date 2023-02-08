
clear 

load b3.mat

load bm.mat


sum1 = 0;

for i = 1:262144
   sum1_tem1 =  b3(i,:) -  bm(i,:);
   sum1_tem2 = sum1_tem1(1)^2 + sum1_tem1(2)^2 + sum1_tem1(3)^2;
   sum1_tem3 = sqrt(sum1_tem2);
   sum1_tem4 = bm(i,1)^2 + bm(i,2)^2 + bm(i,3)^2;
   sum1_tem5 = sqrt(sum1_tem4);

   sum1_tem6 = sum1_tem3/sum1_tem5;

   sum1 =  sum1 + sum1_tem6 ;
 
end


Em = 1 - sum1/262144;

save('Em.mat','Em')