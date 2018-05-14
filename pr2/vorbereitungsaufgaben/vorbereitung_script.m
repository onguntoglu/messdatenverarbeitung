%% Aufgabe 2 - Butterworth 2. Ordnung
clear
fc = 3100;  % cutoff frequency (Grenzfrequenz)

[b,a] = butter(2, 1); % 2. Ordnung Butterworth
sys_butter2 = tf(b,a);
bode(sys_butter2)