%% Abgabeaufgaben
%% Aufgabe 2
clf
fc = 3100; % cutoff frequency
fs2 = 198330; % sampling rate
normalized2 = fc/(fs2/2);
[B2,A2] = butter(2,normalized2);
freqz(B2,A2);
title('Frequency Response of Butterworth-Filter 2. Ordnung')


%% Aufgabe 3
clf
fs8 = 14747; % sampling rate
normalized8 = fc/(fs8/2);
[B8,A8] = butter(8,normalized8);
freqz(B8,A8);
title('Frequency Response of Butterworth-Filter 8. Ordnung')

%% Aufgabe 5
% Kennlinien
clf
load('flanke.mat')
x = Code2Volt(flanke,65.5549,-9.8077);
scatter(x,flanke)
grid on
hold on
p = polyfit(x',flanke',1);
steigung_adu = p(1);
offset_adu = p(2);
steigung_theo = 1023/14;
p2 = steigung_theo*x;
p3 = polyval(p,x);
plot(x,p2)
plot(x,p3)
title('ADU-Codierung')
xlabel('Spannung in Volt')
ylabel('Binary-Codes')
legend('ADU-real-messpunkten','ADU-ideal','ADU-real','Location','northwest')


%% SNR und ENOB
clf
% Differenz zwischen Flanke und Regressionsgraden bilden
% digitale Binärcodes in Spannungsbereich transformieren
c2v_p2 = Code2Volt(p3,65.5549,-9.8077);
c2v_flanke = Code2Volt(flanke,65.5549,-9.8077);
differenz = c2v_p2 - c2v_flanke;
% SNR signal(flanke)-noise(differenz)-ratio
signal_to_noise_ratio = snr(flanke,differenz);
% Effektive Anzahl von Bits
enob = (signal_to_noise_ratio - 1.76)/6.02;
% Plot Differenzsignal
plot(differenz)
grid on;
title('Differenzsignal');
ylabel('Spannung [V]');
xlabel('Index');
ylim([3*-10^-16,10^-16]);