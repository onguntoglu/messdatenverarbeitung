function g_w = FIRentwurf( fs, fg , wn )
%fs = Abtastfrequenz
%fg = Grenzfrequenz
%wn = Fensterfolge
n = length(wn); 
g_w = zeros(1,n);
T = 1/fs;

tau = (n/2);

for k = 1:n 
    g_w(k) = wn(k)* (sin(2*pi*fg*((k-tau)*T)))/(pi*((k-tau)*T));    
end

sum_y = sum(g_w);
g_w = g_w./sum_y;
end

