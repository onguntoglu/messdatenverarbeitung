%% Aufgabe 1
% Data load
load('data_a1.mat', 'data_a1');
data_a1_volt = Code2Volt(data_a1, 65.5549,-9.8077);

% FFT-Spektrum
Fs = 15000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = length(data_a1);             % Length of signal
t = (0:L-1)*T;        % Time vector
Y = fft(data_a1_volt);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
figure(1)
stem(f,P1)
xlim ([0 ,1500]);
grid on
title('Single-Sided Amplitude Spectrum of Signal + Noise')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%saveas(gcf,'p1_signalnoise.png')
figure(2)
P1_signal = P1;
for i=1:length(P1)
   if i ~= 45
       P1_signal(i) = 0;
   end
end
stem(f,P1_signal)
xlim ([0 ,1500]);
grid on
title('Single-Sided Amplitude Spectrum of Signal')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%saveas(gcf,'p1_signal.png')
figure(3)
P1_noise = P1;
P1_noise(45) = 0;
stem(f,P1_noise)
xlim([0 ,1500]);
grid on
title('Single-Sided Amplitude Spectrum of Noise')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%saveas(gcf,'p1_noise.png')

%% Aufgabe 2
nachabtast = DecimFilt(1,data_a1_volt,5);

% FFT-Spektrum
Fs = 3000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = length(nachabtast);             % Length of signal
t = (0:L-1)*T;        % Time vector

Y = fft(nachabtast);
P2_nachabtast = abs(Y/L);
P1_nachabtast = P2_nachabtast(1:L/2+1);
P1_nachabtast(2:end-1) = 2*P1_nachabtast(2:end-1);
f = Fs*(0:(L/2))/L;
figure(4)
stem(f,P1_nachabtast)
xlim ([0 ,1500]);
grid on
title('Single-Sided Amplitude Spectrum of Signal + Noise - Nachabtastung')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%saveas(gcf,'p2_nachabtast.png')


%% Aufgabe 3

fg_filter = 1070;
blackman_window = blackman(93);
digFilter = FIRentwurf(fg_filter,15000,blackman_window);
signal_with_Filter = FIRFilterung(digFilter,data_a1_volt);
Fs = 15000;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = length(signal_with_Filter);             % Length of signal
t = (0:L-1)*T;        % Time vector
figure(5)
plot(t,signal_with_Filter)
xlabel('Zeit [s]');
ylabel('Amplitude [V]');
title('Signal nach der FIR-Filterung');
grid on
%saveas(gcf,'p3_signalfilter.png')


nachabtast_signalfilt = DecimFilt(1,signal_with_Filter,5);

% FFT-Spektrum
Fs = 3000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = length(nachabtast);             % Length of signal
t = (0:L-1)*T;        % Time vector

Y = fft(nachabtast_signalfilt);
P2_nachabtast_signalfilt = abs(Y/L);
P1_nachabtast_signalfilt = P2_nachabtast_signalfilt(1:L/2+1);
P1_nachabtast_signalfilt(2:end-1) = 2*P1_nachabtast_signalfilt(2:end-1);
f = Fs*(0:(L/2))/L;
figure(6)
stem(f,P1_nachabtast_signalfilt)
xlim ([0 ,1500]);
grid on
title('Spektrum - Signal mit FIR-Filterung - Nachabtastung')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%saveas(gcf,'p3_signalfilternach.png')

%% Aufgabe 4
fg_filter = 1070;
blackman_window = blackman(93);
digFilter = FIRentwurf(fg_filter,15000,blackman_window);
signal_decimfilt = DecimFilt(digFilter,data_a1_volt,5);

%Plot in Zeitbereich, nachabgetastet mit DecimFilt
Fs = 3000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = length(signal_decimfilt);             % Length of signal
t = (0:L-1)*T;        % Time vector
figure(7)
plot(t,signal_decimfilt)
xlabel('Zeit [s]');
ylabel('Amplitude [V]');
title('Signal ermittelt nach DecimFilt');
grid on

% FFT-Spektrum
Fs = 3000;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = length(signal_decimfilt);             % Length of signal
t = (0:L-1)*T;        % Time vector
Y = fft(signal_decimfilt);
P2_nachabtast_signalfilt = abs(Y/L);
P1_nachabtast_signalfilt = P2_nachabtast_signalfilt(1:L/2+1);
P1_nachabtast_signalfilt(2:end-1) = 2*P1_nachabtast_signalfilt(2:end-1);
f = Fs*(0:(L/2))/L;
figure(8)
stem(f,P1_nachabtast_signalfilt)
xlim ([0 ,1500]);
grid on

title('Spektrum - Signal mit DecimFilt')
xlabel('f (Hz)')
ylabel('|P1(f)|')



%% Effektivwert und SNR

% DFT berechnen
dft_signal = fft(data_a1_volt);
dft_nachabtast = fft(nachabtast);
dft_signalfilt = fft(signal_with_Filter);
dft_signalfiltnach = fft(nachabtast_signalfilt);

% Amplitudenspektrumanalyse für die Signal-Rauschen-Trennung
dft_signal_abs = abs(dft_signal);
dft_nachabtast_abs = abs(dft_nachabtast);
dft_signalfilt_abs = abs(dft_signalfilt);
dft_signalfiltnach_abs = abs(dft_signalfiltnach);

% Rauschen isolieren und Effektivwert SNR
% PR1 - Signal
dft_signal_abs_max_index = find(dft_signal_abs == max(dft_signal_abs));
dft_signal_n = dft_signal;
dft_signal_n(dft_signal_abs_max_index(1)) = 0;
dft_signal_n(dft_signal_abs_max_index(2)) = 0;

RMS_signal_n = sqrt(sum((abs(dft_signal_n)/length(dft_signal_n)).^2));
RMS_signal = sqrt(sum((abs(dft_signal)/length(dft_signal)).^2));
SNR_signal = 20*log10((RMS_signal/RMS_signal_n));

% PR2 - Nachabgetastetes Signal
dft_nachabtast_abs_max_index = find(dft_nachabtast_abs == max(dft_nachabtast_abs));
dft_nachabtast_n = dft_nachabtast;
dft_nachabtast_n(dft_nachabtast_abs_max_index(1)) = 0;
dft_nachabtast_n(dft_nachabtast_abs_max_index(2)) = 0;

RMS_nachabtast_n = sqrt(sum((abs(dft_nachabtast_n)/length(dft_nachabtast_n)).^2));
RMS_nachabtast = sqrt(sum((abs(dft_nachabtast)/length(dft_nachabtast)).^2));
SNR_nachabtast = 20*log10((RMS_nachabtast/RMS_nachabtast_n));

% PR3 - Signal mit Filterung

dft_signalfilt_abs_max_index = find(dft_signalfilt_abs == max(dft_signalfilt_abs));
dft_signalfilt_n = dft_signalfilt;
dft_signalfilt_n(dft_signalfilt_abs_max_index(1)) = 0;
dft_signalfilt_n(dft_signalfilt_abs_max_index(2)) = 0;

RMS_signalfilt_n = sqrt(sum((abs(dft_signalfilt_n)/length(dft_signalfilt_n)).^2));
RMS_signalfilt = sqrt(sum((abs(dft_signalfilt)/length(dft_signalfilt)).^2));
SNR_signalfilt = 20*log10((RMS_signalfilt/RMS_signalfilt_n));

% PR3 - Signal mit Filterung - Nachabtastung

dft_signalfiltnach_abs_max_index = find(dft_signalfiltnach_abs == max(dft_signalfiltnach_abs));
dft_signalfiltnach_n = dft_signalfiltnach;
dft_signalfiltnach_n(dft_signalfiltnach_abs_max_index(1)) = 0;
dft_signalfiltnach_n(dft_signalfiltnach_abs_max_index(2)) = 0;

RMS_signalfiltnach_n = sqrt(sum((abs(dft_signalfiltnach_n)/length(dft_signalfiltnach_n)).^2));
RMS_signalfiltnach = sqrt(sum((abs(dft_signalfiltnach)/length(dft_signalfiltnach)).^2));
SNR_signalfiltnach = 20*log10((RMS_signalfiltnach/RMS_signalfiltnach_n));


