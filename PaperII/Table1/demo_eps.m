
clear 

load b3.mat

load bm.mat


sum1 = 0;
for i = 1:262144
   sum1_tem1 =  b3(i,:) * b3(i,:)';
   sum1 = sum1 + sum1_tem1;
end

sum2 = 0;
for i = 1:262144  
   sum2_tem1 =  bm(i,:) * bm(i,:)';
   sum2 = sum2 + sum2_tem1;
end


eps = sum1/sum2;

save('eps.mat','eps')