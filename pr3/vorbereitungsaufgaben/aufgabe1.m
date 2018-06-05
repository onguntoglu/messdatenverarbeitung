%% DFT Untersuchungen
clear
id = 5;
t = linspace(1,100);
phi = pi/3;
i = id*sin(2*pi*50*t + phi);
Y = fft(i); % FFT von I(t)
betrag_Y = abs(Y); % Betrag von Y
phase_Y = angle(Y); % Phase von Y
