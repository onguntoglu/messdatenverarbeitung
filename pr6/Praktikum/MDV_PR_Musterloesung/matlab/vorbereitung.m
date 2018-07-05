fg = 1000;  % Grenzfreq
fs = 15000; % Abtastfrequenz
fenster = blackman(93);
filter_koeff = FIRentwurf(fg,fs,fenster);
figure(1)
freqz(filter_koeff)

coeffs = zeros(1,length(filter_koeff));
for i=1:length(filter_koeff)
   value = int16(filter_koeff(i) * 2^15);
   value = round(value);
   coeffs(i) = value;
end
figure(2)
plot(coeffs)
exportKoeff(coeffs);
figure(4)
freqz(coeffs./2^15)