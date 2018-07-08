function [BetragXf,PhaseXf]=Spektrum (xt,wn,startfenster,fs,LogFlag)
% function [BetragXf,PhaseXf]=Spektrum(xt,wn,fs,LogFlag,n)
% description: Bestimmt und plottet das Betrags- und
%              Phasenspektrum eines Signals xt
% input:       xt - Signal im Zeitbereich
%              wn - Fensterfolge  hann(L) , blackman(L)
%              fs - Abtastfrequenz
%              LogFlag - Flag = 1 y-Achse fuer das
%              Betragsspektrum wird logaritmisch
%              in dB dargestellt, sonst 0
%
% output:      BetragXf - Betragsspektrum des Signals xt
%              PhaseXf - Phasenspektrum des Signals xt
%              Bildschirm - Plotten des Betrags-
%              und Phasenspektrums

vec_window = zeros(1,length(xt));
vec_window(startfenster:startfenster+length(wn)-1) = wn;
signalfenster = xt'.* vec_window; 
anzahlmesswerte = length(xt);
%f = fs*(0:(anzahlmesswerte/2))/anzahlmesswerte; % Frequenz-Achse
f = (0:anzahlmesswerte-1)*((2*fs)/anzahlmesswerte);

anzahlfenster = sum(wn);

DFT = fft(signalfenster);
Amp = abs(DFT)/anzahlfenster;

if(LogFlag == 1)
   BetragXf = 20*log10(Amp);
   PhaseXf = unwrap(angle(DFT)); 
else
   BetragXf = Amp;
   PhaseXf = unwrap(angle(DFT));
end

subplot(2,1,1)
plot(f,BetragXf);
title('Magnitude');
xlabel('Frequency in Hz');
ylabel('Amplitudengang');
% ax = gca;
% ax.XTick = [5 15 30 45 60 75 90 95];
grid on;

subplot(2,1,2)
plot(f,PhaseXf);
title('Phase');
xlabel('Frequency in Hz');
ylabel('Phasengang');
% ax = gca;
% ax.XTick = [5 15 30 45 60 75 90 95];
grid on;

end