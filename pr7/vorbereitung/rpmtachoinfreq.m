function drehzahl = rpmtachoinfreq(tachosig,fs)
%Plottet das Amplitudenspektrum von ein Tachosignal
%Berechnet den Drehzahl aus dem Tachosignal

DFT = fft(tachosig);
n = length(tachosig);
Amptacho = abs(DFT)/n;
f = (0:n-1)*(fs/(n-1));
plot(f,Amptacho);
title('Amplitudenspektrum fuer Motortacho');
xlabel('Frequency in Hz');
ylabel('Amplitude');

[maxtacho indexmaxtacho] = max(Amptacho);
drehzahl = round(60*(f(indexmaxtacho)/8));
end

