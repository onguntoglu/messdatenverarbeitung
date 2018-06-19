fg = 1000;  % Grenzfreq
fs = 15000; % Abtastfrequenz
fenster = blackman(93);
filter_koeff = FIRentwurf(1000,15000,fenster);

coeffs = zeros(1,length(filter_koeff));
for i=1:length(filter_koeff)
   value = int16(filter_koeff(i) * 2^15);
   value = round(value);
   coeffs(i) = value;
end
exportKoeff(coeffs);