%% Aufgabe 2 - Butterworth 2. Ordnung
clear
fg = 3100;
[b,a] = butter(2, 2*pi*fg); % 2. Ordnung Butterworth, Grenzfreq 3.1kHz
sys_butter2 = tf(b,a);
bode(sys_butter2)