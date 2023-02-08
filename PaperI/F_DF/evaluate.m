
load data_test.mat

load  para_test.mat
t_Test = t_test;

% phi_Test = test_data(3,:);
numPredictions = length(t_Test);


r = 2;

a = sqrt(0.427405527444639);

t_Test = dlarray(t_Test,"CB");

F_Fprime_Pred = model(parameters,t_Test);

%subplot(1,2,1)


% fig 1
figure
plot(t_Test,extractdata(F_Fprime_Pred(1,:)),"-",LineWidth=2);
hold on
plot(t_Test,F_test, "--",LineWidth=2)
%title('F')
hold off
legend("MLP","Runge-Kutta",'Location','best')
legend('boxoff')

% fig 2
figure
%subplot(1,2,2)
plot(t_Test,extractdata(F_Fprime_Pred(2,:)),"-",LineWidth=2);
hold on
plot(t_Test,F_prime_test, "--",LineWidth=2)
hold off
%title('Fprime')
legend("MLP","Runge-Kutta",'Location','best')
legend('boxoff')


% fig 3
figure
%subplot(1,2,1)
plot(t_Test,extractdata(F_Fprime_Pred(1,:)) - F_test ,"-",LineWidth=2);
%title('F-diff')

%fig 4
figure
%subplot(1,2,2)
plot(t_Test,extractdata(F_Fprime_Pred(2,:)) - F_prime_test ,"-",LineWidth=2);
%title('Fprime_diff')



%subplot(1,2,2)
%legend("MLP","Runge-Kutta")

%figure

F_MLP = extractdata(F_Fprime_Pred(1,:));
Fprime_MLP = extractdata(F_Fprime_Pred(2,:));

F_MLP_new = F_MLP(2:end-1);
Fprime_MLP_new = Fprime_MLP(2:end-1);


F_test_new = F_test(2:end-1);
F_prime_test_new = F_prime_test(2:end-1);

t_new = t_Test(2:end-1);

temp1 = sqrt(1 - t_new.^2);

B_r_MLP = - r^-3 .* Fprime_MLP_new;
B_theta_MLP = r^-3 ./ temp1 .* F_MLP_new;
B_phi_MLP =  r^-3 ./ temp1 * a .* F_MLP_new .^2;

B_r_RK = - r^-3 .* F_prime_test_new;
B_theta_RK = r^-3 ./ temp1 .* F_test_new;
B_phi_RK =  r^-3 ./ temp1 * a .* F_test_new .^2;

%fig 5
figure
%subplot(1,3,1)
plot(t_new,B_r_MLP,"-",LineWidth=2);
hold on
plot(t_new,B_r_RK, "--",LineWidth=2)
%title('B_r')
hold off
legend("MLP","Runge-Kutta",'Location','best')
legend('boxoff')


%fig 6
figure 
%subplot(1,3,2)
plot(t_new,B_theta_MLP,"-",LineWidth=2);
hold on
plot(t_new,B_theta_RK, "--",LineWidth=2)
%title('B_{theta}')
hold off
legend("MLP","Runge-Kutta",'Location','best')
legend('boxoff')

%fig 7
figure 
%subplot(1,3,3)
plot(t_new,B_phi_MLP,"-",LineWidth=2);
hold on
plot(t_new,B_phi_RK, "--",LineWidth=2)
%title('B_{phi}')
hold off
%subplot(1,3,1)
legend("MLP","Runge-Kutta",'Location','best')
legend('boxoff')