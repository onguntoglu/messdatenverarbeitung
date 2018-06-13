function yk=DecimFilt (bk ,  xk ,  fr )

n = length(xk);
yk_length = n/fr; %die Lange der nachabgetasteten Signals

yk = zeroes(1,yk_length);

sigfilter = filter(bk,1,xk);

for k = 1:yk_length
    
yk(k) = sigfilter(k*fr);

end   

end

