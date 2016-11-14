function w = H1(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%
%(C) Nikolai Rozanov
%
%quadratic Kernel
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start
%%%%%%%%%%%%%%%%%%%%%%%%%%
Kernel_quadratic = @(x) 1-(x.^2)/0.01;

if x<-0.1 
    w = 0;
elseif x>0.1
         w=1;
    else
        
    w = integral(Kernel_quadratic,-0.1,x)/1.3333;
    
end
