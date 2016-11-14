Data = dlmread('npfda-electricity.dat');

months = 1:12;
cont_months = 1:0.1:12;
Kernel_quadratic = @(x) (1-x)*(1-x);
f = cell(1,27);
p = 1;
q = 2;
s=10;
for i = 1:27
    f{1,i} = @(x)spline(months,Data(i,:),x);
    y(:,i) = Data(i+1,:);
end

for j=1:12
    for h= 1:10
        Y_Hat(j,h) = regression(Kernel_quadratic, f, y(j,1:26),f{1,27},cont_months,q,h/s,26);
    end
end

f_hat = @(x) spline(months,Y_Hat(:,p),x);
f_hat2 = @(x) spline(months,Y_Hat(:,6),x);
f_real = @(x) spline(months,y(:,27),x);
f_mse = @(x) (f_hat2(x)-f_real(x)).^2;

mse = integral(f_mse,1,12);


figure
plot(cont_months, f_hat(cont_months), 'g -o');hold on;
plot(cont_months, f_hat2(cont_months), 'b');hold on;
plot(cont_months, f_real(cont_months), 'r');

