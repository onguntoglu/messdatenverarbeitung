function yk=FIRFilterung (bk ,  xk)

output = zeros(1,length(xk)); 
summe = 0;

for n = 1:length(xk)

    for k = 1:length(bk)
        if n > k 
        summe = bk(k)*xk(n-k+1) + summe;
        end
    end
    output(n) = summe;
    summe = 0;
end

yk = output;
end