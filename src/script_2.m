
%%%%%%%%%%%%%%%%%%%%%%%%%%
%(C) Nikolai Rozanov
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start
%%%%%%%%%%%%%%%%%%%%%%%%%%


Data = dlmread('npfda-electricity.dat');

months = 1:12;
cont_months = 1:0.1:12;
Kernel_quadratic = @(x) 1-x.^2;
f = cell(1,27);
p = 9;
q = 0;
s=10;
for i = 1:27
    f{1,i} = @(x)interp1(months,Data(i,:),x);
    y(:,i) = Data(i+1,:);
end

for j=1:12
    for h= 1:2:30
        Y_Hat(j,h) = regression(Kernel_quadratic, f, y(j,1:26),f{1,27},cont_months,q,h/s,26);
    end
end


f_hat = @(x) interp1(months,Y_Hat(:,29),x);
f_hat2 = @(x) interp1(months,Y_Hat(:,13),x);
f_real = @(x) interp1(months,y(:,27),x);
f_mse = @(x) (f_hat2(x)-f_real(x)).^2;




mse2 = integral(f_mse,1,12);



figure
plot(cont_months, f_hat(cont_months), 'g-o');hold on;
plot(cont_months, f_hat2(cont_months), 'b');hold on;
plot(cont_months, f_real(cont_months), 'r');

title('Regression');
xlabel('Months');
ylabel('log(electricity-consumption)');
legend('Regression, h small', 'Regression, h large','Real Data', 'location', 'southwest');
annotation('textbox',[0.2 0.8 0.16 0.04],'String',{'MSE =0,0143'},'FontSize',14, 'FontName','Times New Roman');




