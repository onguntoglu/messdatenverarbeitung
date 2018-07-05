load('aufgabe3.mat');

abtast15khz=Code2Volt(a3_abtast15khz,65.5549,-9.8077);
abtast15khz_fir=Code2Volt(a3_abtast15khz_fir,65.5549,-9.8077);
abtast15khz_fir_dec=Code2Volt(a3_abtast15khz_fir_dec,65.5549,-9.8077);

fs15 = 15000;
n15 = length(abtast15khz);
t15 = linspace(0,n15-1,n15)*(1/fs15);

fs_dec = 3000;
n_dec = length(abtast15khz_fir_dec);
t_dec = linspace(0,n_dec-1,n_dec)*(1/fs_dec);

%F?r die gleiche Zeitdauer plotten

figure(1);
plot(abtast15khz)
xlabel('Samples');
ylabel('Amplitude in V');
title('Signal mit 15kHz Abtastrate');
grid on;

figure(2);
plot(abtast15khz_fir)
xlabel('Samples');
ylabel('Amplitude in V');
title('Signal mit FIR-Filter');
grid on;

figure(3);
plot(abtast15khz_fir_dec)
xlabel('Samples');
ylabel('Amplitude in V');
title('Signal mit FIR-Filter und Dezimation');
grid on;