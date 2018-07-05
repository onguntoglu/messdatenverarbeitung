load('aufgabe2.mat');

abtast15khz=Code2Volt(a2_abtast15khz,65.5549,-9.8077);
abtast3khz=Code2Volt(a2_abtast3khz,65.5549,-9.8077);

fs15 = 15000;
n15 = length(abtast15khz);
t15 = linspace(0,n15-1,n15)*(1/fs15);

fs3 = 3000;
n3 = length(abtast3khz);
t3 = linspace(0,n3-1,n3)*(1/fs3);

%F?r die gleiche Zeitdauer plotten

figure(1);
plot(t15,abtast15khz)
xlabel('Zeit in s');
ylabel('Amplitude in V');
title('Signal mit 15kHz Abtastrate');
grid on;

figure(2);
plot(t3(1:201),abtast3khz(1:201))
xlabel('Zeit in s');
ylabel('Amplitude in V');
title('Signal mit 3kHz Abtastrate');
grid on;
