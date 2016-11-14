function F_hat = median(Kernel, f_vec, y_vec, f_test, points,q,h,n);
%%%%%%%%%%%%%%%%%%%%%%%%%%
%(C) Nikolai Rozanov
%
%computes kernel median method as described in the report
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start
%%%%%%%%%%%%%%%%%%%%%%%%%%

f_temp = @H;
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

F_hat = @(y) arrayfun(f_temp,(y-y_vec));



F_hat = @(y) K*F_hat(y)'/sum(K);

