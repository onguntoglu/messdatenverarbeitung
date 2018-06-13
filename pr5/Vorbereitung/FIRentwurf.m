function g_w = FIRentwurf( fs, fg , wn )
%fs = Abtastfrequenz
%fg = Grenzfrequenz
%wn = Fensterfolge
n = length(wn); 

Abtastperiode = 1/fs;

tau = Abtastperiode*(n/2);

for k = 1:n
    
g_w(k) = wn(k)* (sin(2*pi*fg((T*k-tau)) )) /(pi*((T*k-tau)));    
end


end

