load('aufgabe2.mat');

abtast15khz=Code2Volt(a2_abtast15khz,65.5549,-9.8077);
abtast3khz=Code2Volt(a2_abtast3khz,65.5549,-9.8077);

load('aufgabe3.mat');

%abtast15khz=Code2Volt(a3_abtast15khz,65.5549,-9.8077);
abtast15khz_fir=Code2Volt(a3_abtast15khz_fir,65.5549,-9.8077);
abtast15khz_fir_dec=Code2Volt(a3_abtast15khz_fir_dec,65.5549,-9.8077);


% FFT-Spektrum f?r Signal mit 15kHz Abtastrate
Fs = 15000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = length(abtast15khz);             % Length of signal
t = (0:L-1)*T;        % Time vector
Y = fft(abtast15khz);
P2 = abs(Y/L);
P1 = P2(1:L/2);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2)-1)/L;
figure(1)
stem(f,P1) 
title('Signal mit analoges Filter und 15kHz Abtastrate')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 1500]);

% FFT-Spektrum f?r Signal mit 3kHz Abtastrate
Fs = 3000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = length(abtast3khz);             % Length of signal
t = (0:L-1)*T;        % Time vector
Y = fft(abtast3khz);
P2 = abs(Y/L);
P1 = P2(1:L/2);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2)-1)/L;
figure(2)
stem(f,P1) 
title('Signal mit analoges Filter und 3kHz Abtastrate')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 1500]);


% FFT-Spektrum f?r Signal mit 15kHz Abtastrate und digitales Filter
Fs = 3000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = length(abtast15khz_fir_dec);             % Length of signal
t = (0:L-1)*T;        % Time vector
Y = fft(abtast15khz_fir_dec);
P2 = abs(Y/L);
P1 = P2(1:L/2);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2)-1)/L;
figure(3)
stem(f,P1) 
title('Signal mit digitales Filter und 15kHz Abtastrate und Nachabtastung')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 1500]);

%% Effektivwert und SNR

% DFT berechnen
dft_abtast15khz = fft(abtast15khz);
dft_abtast3khz = fft(abtast3khz);
dft_abtast15khz_fir_dec = fft(abtast15khz_fir_dec);

% Amplitudenspektrumanalyse für die Signal-Rauschen-Trennung
dft_abtast15khz_abs = abs(dft_abtast15khz);
dft_abtast3khz_abs = abs(dft_abtast3khz);
dft_abtast15khz_fir_dec_abs = abs(dft_abtast15khz_fir_dec);

% Rauschen isolieren und Effektivwert SNR
% Signal_15khz
dft_abtast15khz_abs_max_index = find(dft_abtast15khz_abs == max(dft_abtast15khz_abs));
dft_abtast15khz_n = dft_abtast15khz;
dft_abtast15khz_n(dft_abtast15khz_abs_max_index(1)) = 0;
dft_abtast15khz_n(dft_abtast15khz_abs_max_index(2)) = 0;

dft_abtast15khz_iso = zeros(1,length(dft_abtast15khz));
dft_abtast15khz_iso(dft_abtast15khz_abs_max_index(1)) = dft_abtast15khz(dft_abtast15khz_abs_max_index(1));
dft_abtast15khz_iso(dft_abtast15khz_abs_max_index(2)) = dft_abtast15khz(dft_abtast15khz_abs_max_index(2));

RMS_abtast15khz_n = sqrt(sum((abs(dft_abtast15khz_n)/length(dft_abtast15khz_n)).^2));
RMS_abtast15khz = sqrt(sum((abs(dft_abtast15khz_iso)/length(dft_abtast15khz_iso)).^2));
SNR_abtast15khz = 20*log10((RMS_abtast15khz/RMS_abtast15khz_n));

% Signal 3khz
dft_abtast3khz_abs_max_index = find(dft_abtast3khz_abs == max(dft_abtast3khz_abs));
dft_abtast3khz_n = dft_abtast3khz;
dft_abtast3khz_n(dft_abtast3khz_abs_max_index(1)) = 0;
dft_abtast3khz_n(dft_abtast3khz_abs_max_index(2)) = 0;

dft_abtast3khz_iso = zeros(1,length(dft_abtast3khz));
dft_abtast3khz_iso(dft_abtast3khz_abs_max_index(1)) = dft_abtast3khz(dft_abtast3khz_abs_max_index(1));
dft_abtast3khz_iso(dft_abtast3khz_abs_max_index(2)) = dft_abtast3khz(dft_abtast3khz_abs_max_index(2));

RMS_abtast3khz_n = sqrt(sum((abs(dft_abtast3khz_n)/length(dft_abtast3khz_n)).^2));
RMS_abtast3khz = sqrt(sum((abs(dft_abtast3khz_iso)/length(dft_abtast3khz_iso)).^2));
SNR_abtast3khz = 20*log10((RMS_abtast3khz/RMS_abtast3khz_n));
%%
% 15kHz Abtastrate und digitales Filter

dft_abtast15khz_fir_dec_abs_max_index = find(dft_abtast15khz_fir_dec_abs == max(dft_abtast15khz_fir_dec_abs));
dft_abtast15khz_fir_dec_n = dft_abtast15khz_fir_dec;
dft_abtast15khz_fir_dec_n(dft_abtast15khz_fir_dec_abs_max_index(1)) = 0;
dft_abtast15khz_fir_dec_n(dft_abtast15khz_fir_dec_abs_max_index(2)) = 0;

dft_abtast15khz_fir_dec_iso = zeros(1,length(dft_abtast15khz_fir_dec));
dft_abtast15khz_fir_dec_iso(dft_abtast15khz_fir_dec_abs_max_index(1)) = dft_abtast15khz_fir_dec(dft_abtast15khz_fir_dec_abs_max_index(1));
dft_abtast15khz_fir_dec_iso(dft_abtast15khz_fir_dec_abs_max_index(2)) = dft_abtast15khz_fir_dec(dft_abtast15khz_fir_dec_abs_max_index(2));

RMS_abtast15khz_fir_dec_n = sqrt(sum((abs(dft_abtast15khz_fir_dec_n)/length(dft_abtast15khz_fir_dec_n)).^2));
RMS_abtast15khz_fir_dec = sqrt(sum((abs(dft_abtast15khz_fir_dec_iso)/length(dft_abtast15khz_fir_dec_iso)).^2));
SNR_abtast15khz_fir_dec = 20*log10((RMS_abtast15khz_fir_dec/RMS_abtast15khz_fir_dec_n));