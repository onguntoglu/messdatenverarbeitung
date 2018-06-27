%% Aufgabe 1
% Data load
load('data_a1.mat', 'data_a1');
data_a1_volt = Code2Volt(data_a1, 65.5549,-9.8077)

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
plot(f,P1)
grid on
title('Single-Sided Amplitude Spectrum of Signal + Noise')
xlabel('f (Hz)')
ylabel('|P1(f)|')
figure(2)
P1_signal = P1;
for i=1:length(P1)
   if i ~= 45
       P1_signal(i) = 0;
   end
end
plot(f,P1_signal)
grid on
title('Single-Sided Amplitude Spectrum of Signal')
xlabel('f (Hz)')
ylabel('|P1(f)|')
figure(3)
P1_noise = P1;
P1_noise(45) = 0;
plot(f,P1_noise)
grid on
title('Single-Sided Amplitude Spectrum of Noise')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%% Aufgabe 2
nachabtast = DecimFilt(1,data_a1_volt,2);

% FFT-Spektrum
Fs = 3000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = length(nachabtast);             % Length of signal
t = (0:L-1)*T;        % Time vector

Y = fft(nachabtast);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
figure(4)
plot(f,P1)
grid on

title('Single-Sided Amplitude Spectrum of Signal + Noise - Nachabtastung')
xlabel('f (Hz)')
ylabel('|P1(f)|')



