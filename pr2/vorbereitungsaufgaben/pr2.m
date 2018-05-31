fc = 3100; % cutoff frequency
fs2 = 198330; % sampling rate
normalized2 = fc/(fs2/2);
[B2,A2] = butter(2,normalized2);
freqz(B2,A2);
title('Frequency Response of Butterworth-Filter 2. Ordnung')
clf
fs8 = 14747;
normalized8 = fc/(fs8/2);
[B8,A8] = butter(8,normalized8);
freqz(B8,A8);
title('Frequency Response of Butterworth-Filter 8. Ordnung')

