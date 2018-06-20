function yk=FIRFilterung (bk ,  xk)

output = zeros(1,length(xk)); 
summe = 0;

for n = 1:length(xk)
    
    for k = 1:length(bk)
        if 
        summe = bk(k)*xk(n-k) + summe;
    end
    output(n) = summe;
end

yk = output;
end