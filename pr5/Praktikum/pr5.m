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
saveas(gcf,'p1_signalnoise.png')
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
saveas(gcf,'p1_signal.png')
figure(3)
P1_noise = P1;
P1_noise(45) = 0;
stem(f,P1_noise)
xlim([0 ,1500]);
grid on
title('Single-Sided Amplitude Spectrum of Noise')
xlabel('f (Hz)')
ylabel('|P1(f)|')
saveas(gcf,'p1_noise.png')

% Effektivwertberechnungen

eff_p1_signal = rms(P1)*length(P1)*2;
eff_p1_noise = rms(P1_noise)*length(P1_noise)*2;
snr_pr1 = 20*log10(eff_p1_signal/eff_p1_noise);


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



