function output = TotalHarmonicDistortion(signal)

v_signal = Code2Volt(signal,65.5549,-9.8077);
L = length(signal);
signal_fft = fft(v_signal);
P2 = abs(signal_fft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
[max_signal, index] = max(P1);
P1(index) = 0;
output = sqrt(sum(power(P1,2)))/ max_signal;
