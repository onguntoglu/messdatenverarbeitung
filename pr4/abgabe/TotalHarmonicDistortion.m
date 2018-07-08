function [thd,i,grundfreq] = TotalHarmonicDistortion(signal)
%Eingang: signal
%Ausgang: thd = Total-Harmonic-Distortion
%         i = Anzahl der Obershwingungen

v_signal = Code2Volt(signal,65.5549,-9.8077);

fs= 5000;

anzahlmesswerte = length(signal);
signal_fft = fft(v_signal);
signal_fft_new = signal_fft(1:length(signal_fft)/2);
abs_signal_fft = abs(signal_fft_new);

[max_signal, index] = max(abs_signal_fft); %Grundschwingung finden

harmonyinterval = index-1; %Der Abstand zwischen 
                           %die Oberschwingungen feststellen
start = index+harmonyinterval; %Die erste Oberschwingung
f = (0:anzahlmesswerte/2-1)*((fs)/anzahlmesswerte);
i = 0;
for k=start:harmonyinterval:length(abs_signal_fft)
    %Ein Vektor f?r die Oberschwingungen erstellen
i= i+1;
    harmonics(i) = abs_signal_fft(k);
    
end

grundfreq = f(index);
thd = 100*sqrt(sum(power(harmonics,2)))/ max_signal;

disp('Frequenz der Grundschwingung ist:');
disp(grundfreq);

disp('Total-Harmonic-Distortion in prozent ist:');
disp(thd);

disp('Die Anzahl der Oberschwingungen ist:');
disp(i);
end