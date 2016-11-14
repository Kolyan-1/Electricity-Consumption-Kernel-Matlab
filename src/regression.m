function y_reg_hat = regression(Kernel, f_vec, y_vec, f_test, points,q,h,n);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%(C) Nikolai Rozanov
%
% Computes Kernel Regression
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start
%%%%%%%%%%%%%%%%%%%%%%%%%%
if h<=0
    h = 1;
end

if n>size(f_vec)
    n= f_vec;
end

for i = 1:n
    if abs(d_deriv(f_vec{1,i},f_test,points,q))<=h
               K(i) = Kernel(d_deriv(f_vec{1,i},f_test,points,q)/h);
    else K(i) = 0;
    end
end
y_reg_hat= K*y_vec'/sum(K);