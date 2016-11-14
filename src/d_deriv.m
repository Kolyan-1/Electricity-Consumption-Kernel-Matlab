
function d = d_deriv(f1, f2, eval_points, q)

%%%%%%%%%%%%%%%%%%%%%%%%%%
%(C) Nikolai Rozanov
%
%Computes the derivative metric
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start
%%%%%%%%%%%%%%%%%%%%%%%%%%
f1_vec = f1(eval_points);
f2_vec = f2(eval_points);
if q>0
    f1_diff = diff(f1_vec,q);
    f2_diff = diff(f2_vec,q);
else
    f1_diff = f1_vec;
    f2_diff = f2_vec;
end

d = sqrt((f1_diff-f2_diff)*(f1_diff-f2_diff)');