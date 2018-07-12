%% Aufgabe 1
t = 0:1/1e3:2;
signal = chirp(t,0,1,100);
figure(1);
plot(t,signal);
xlabel('Zeit in s');
ylabel('Amplitude');
title('Chirp Signal');

%%  spectrogram(signal,hamming(128),120,256,1e3,'yaxis');
figure(2)
specfreqchirp=SpecToFreq(signal,hamming(128),120, 256 , 1e3);
zeitchirp = linspace(0,2,length(specfreqchirp));
plot(zeitchirp,specfreqchirp);
title('Zeitlichen Verlauf der Frequenz');
grid on;
ylabel('Frequenz in Hz');
xlabel('Zeit in s');

figure(3)
spectrogram(signal,hamming(128),120,256,1e3,'yaxis');
title('Spektrogramm des Signals');


%% spectrogram(signal,hamming(128),60,256,1e3,'yaxis');
figure(4)
specfreqchirp=SpecToFreq(signal,hamming(128),60, 256 , 1e3);
zeitchirp = linspace(0,2,length(specfreqchirp));
plot(zeitchirp,specfreqchirp);
title('Zeitlichen Verlauf der Frequenz');
grid on;
ylabel('Frequenz in Hz');
xlabel('Zeit in s');

figure(5)
spectrogram(signal,hamming(128),60,256,1e3,'yaxis');
title('Spektrogramm des Signals');

%% spectrogram(signal,hamming(512),500,256,1e3,'yaxis');
figure(6)
specfreqchirp=SpecToFreq(signal,hamming(512),500, 256 , 1e3);
zeitchirp = linspace(0,2,length(specfreqchirp));
plot(zeitchirp,specfreqchirp);
title('Zeitlichen Verlauf der Frequenz');
grid on;
ylabel('Frequenz in Hz');
xlabel('Zeit in s');

figure(7)
spectrogram(signal,hamming(512),500,256,1e3,'yaxis');
title('Spektrogramm des Signals');

%% spectrogram(signal,blackman(128),120,256,1e3,'yaxis');

figure(8)
specfreqchirp=SpecToFreq(signal,blackman(128),120, 256 , 1e3);
zeitchirp = linspace(0,2,length(specfreqchirp));
plot(zeitchirp,specfreqchirp);
title('Zeitlichen Verlauf der Frequenz');
grid on;
ylabel('Frequenz in Hz');
xlabel('Zeit in s');

figure(9)
spectrogram(signal,blackman(128),120,256,1e3,'yaxis');
title('Spektrogramm des Signals');






