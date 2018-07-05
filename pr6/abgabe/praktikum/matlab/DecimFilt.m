function yk=DecimFilt (bk ,  xk ,  fr )

n = length(xk);
yk_length = floor(n/fr); %die Lange der nachabgetasteten Signals

yk = zeros(1,yk_length);

sigfilter = FIRFilterung(bk,xk);

for k = 1:yk_length
    
yk(k) = sigfilter(k*fr);

end   

end

