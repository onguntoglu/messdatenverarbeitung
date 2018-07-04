%% Aufgabe 1
t = 0:1/1e3:2;
signal = chirp(t,0,1,100);
figure(1);
plot(t,signal);
xlabel('Zeit in s');
ylabel('Amplitude');
title('Chirp Signal');

figure(2);
spectrogram(signal,hamming(256),250,256,1e3,'yaxis');
title('mit Hamming-Fenster');

figure(3);
spectrogram(signal,hamming(256),100,256,1e3,'yaxis');
title('mit Hamming-Fenster kleinere Ueberlappung');

figure(4);
spectrogram(signal,hamming(512),250,256,1e3,'yaxis');
title('mit groesserem Hamming-Fenster');

figure(5);
spectrogram(signal,hamming(512),500,256,1e3,'yaxis');
title('mit groesserem Hamming-Fenster und groesserem Ueberlappung');

figure(6);
spectrogram(signal,blackman(256),250,256,1e3,'yaxis');
title('mit Blackman-Fenster');

figure(7);
spectrogram(signal,blackman(256),100,256,1e3,'yaxis');
title('mit Blackman-Fenster kleinere Ueberlappung');





