function w = H(x)

Kernel_quadratic = @(x) 1-x.^2;

if x<-1 
    w = 0;
end

    
if x>1
        
        w=1;
    else
        
    
    w = integral(Kernel_quadratic,-1,x)/1.3333;
    
end
