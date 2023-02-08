
clear 

load b3.mat

load bm.mat

  sum1 = 0;
  sum2 = 0;
  sum3 = 0;

for i = 1:262144
   sum1_tem1 =  b3(i,:) * bm(i,:)';
   sum1 = sum1_tem1 + sum1;

   sum2_tem1 = b3(i,:)  * b3(i,:)';
   sum2 = sum2_tem1 + sum2;

   sum3_tem1 = bm(i,:)  * bm(i,:)';
   sum3 = sum3_tem1 + sum3;

end


tem_sum = sqrt(sum2*sum3);

C_vec = sum1/tem_sum;

save('C_vec.mat','C_vec')