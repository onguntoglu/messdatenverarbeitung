load('motor.mat');
stom10 = mess10.Data.MeasuredData(4).Data;
stom20 = mess20.Data.MeasuredData(4).Data;
stom30 = mess30.Data.MeasuredData(4).Data;
stom40 = mess40.Data.MeasuredData(4).Data;
stom50 = mess50.Data.MeasuredData(4).Data;

tacho10 = mess10.Data.MeasuredData(6).Data;
tacho20 = mess20.Data.MeasuredData(6).Data;
tacho30 = mess30.Data.MeasuredData(6).Data;
tacho40 = mess40.Data.MeasuredData(6).Data;
tacho50 = mess50.Data.MeasuredData(6).Data;

%% Im Zeitbereich berechnen

t = linspace(0, 120000*(1/40000),120000)';
figure(1)
[freq10, null10, zeit10] = freqganginzeit(tacho10,t);
title('Tachosignal mit Versorgungsspannung 10 V');
figure(2)
[freq20, null20, zeit20] = freqganginzeit(tacho20,t);
title('Tachosignal mit Versorgungsspannung 20 V');
figure(3)
[freq30, null30, zeit30] = freqganginzeit(tacho30,t);
title('Tachosignal mit Versorgungsspannung 30 V');
figure(4)
[freq40, null40, zeit40] = freqganginzeit(tacho40,t);
title('Tachosignal mit Versorgungsspannung 40 V');
figure(5)
[freq50, null50, zeit50] = freqganginzeit(tacho50,t);
title('Tachosignal mit Versorgungsspannung 50 V');

statikfreq10 = freq10(length(freq10)-15:length(freq10));
statikfreq20 = freq20(length(freq20)-15:length(freq20));
statikfreq30 = freq30(length(freq30)-15:length(freq30));
statikfreq40 = freq40(length(freq40)-15:length(freq40));
statikfreq50 = freq50(length(freq50)-15:length(freq50));

%F?r die Bestimmung der momentaner Drehfrequenz, 
%die durschnittliche Drehfrequenz waehrend der statische Lauf finden
drehfreq10 = (sum(statikfreq10)/(length(statikfreq10)))/8;
drehfreq20 = (sum(statikfreq20)/(length(statikfreq20)))/8;
drehfreq30 = (sum(statikfreq30)/(length(statikfreq30)))/8;
drehfreq40 = (sum(statikfreq40)/(length(statikfreq40)))/8;
drehfreq50 = (sum(statikfreq50)/(length(statikfreq50)))/8;

drehzahlzeit10 = round(60*(drehfreq10));
drehzahlzeit20 = round(60*(drehfreq20));
drehzahlzeit30 = round(60*(drehfreq30));
drehzahlzeit40 = round(60*(drehfreq40));
drehzahlzeit50 = round(60*(drehfreq50));

disp('Drehzahl des Motors mit 10V im Zeitbereich gerechnet ist:');
disp(drehzahlzeit10);

disp('Drehzahl des Motors mit 20V im Zeitbereich gerechnet ist:');
disp(drehzahlzeit20);

disp('Drehzahl des Motors mit 30V im Zeitbereich gerechnet ist:');
disp(drehzahlzeit30);

disp('Drehzahl des Motors mit 40V im Zeitbereich gerechnet ist:');
disp(drehzahlzeit40);

disp('Drehzahl des Motors mit 50V im Zeitbereich gerechnet ist:');
disp(drehzahlzeit50);

%% Im Frequenzbereich berechnen
figure(6)
drehzahlfreq10 = rpmtachoinfreq(tacho10,40000);
title('Amplitudenspektrum fuer Tachosignal mit 10V');
figure(7)
drehzahlfreq20 = rpmtachoinfreq(tacho20,40000);
title('Amplitudenspektrum fuer Tachosignal mit 20V');
figure(8)
drehzahlfreq30 = rpmtachoinfreq(tacho30,40000);
title('Amplitudenspektrum fuer Tachosignal mit 30V');
figure(9)
drehzahlfreq40 = rpmtachoinfreq(tacho40,40000);
title('Amplitudenspektrum fuer Tachosignal mit 40V');
figure(10)
drehzahlfreq50 = rpmtachoinfreq(tacho50,40000);
title('Amplitudenspektrum fuer Tachosignal mit 50V');

disp('Drehzahl des Motors mit 10V im Frequenzbereich gerechnet ist:');
disp(drehzahlfreq10);

disp('Drehzahl des Motors mit 20V im Frequenzbereich gerechnet ist:');
disp(drehzahlfreq20);

disp('Drehzahl des Motors mit 30V im Frequenzbereich gerechnet ist:');
disp(drehzahlfreq30);

disp('Drehzahl des Motors mit 40V im Frequenzbereich gerechnet ist:');
disp(drehzahlfreq40);

disp('Drehzahl des Motors mit 50V im Frequenzbereich gerechnet ist:');
disp(drehzahlfreq50);

%% Frequenzgaenge plotten zum Vergleich

specfreq10=SpecToFreq(tacho10,hamming(1028),1000, 7500, 40000);
t1 = linspace(0,3,length(freq10));
t2 = linspace(0,3,length(specfreq10));

drehzeit10 = 60*(freq10/8);
drehspec10 = 60*(specfreq10/8);
figure(11)
plot(zeit10,drehzeit10);
title('Versorgungsspannung 10 V');
ylim([0 1400]);
hold on;
grid on;
plot(t2,drehspec10);
ylabel('Drehzahl');
xlabel('Zeit in s');
legend('Mittels Nullgaenge','Mittels Spectrogramm','Location','SouthEast');


specfreq20=SpecToFreq(tacho20,hamming(1028),1000, 7500, 40000);
t1 = linspace(0,3,length(freq20));
t2 = linspace(0,3,length(specfreq20));

drehzeit20 = 60*(freq20/8);
drehspec20 = 60*(specfreq20/8);
figure(12)
plot(zeit20,drehzeit20);
title('Versorgungsspannung 20 V');
ylim([0 3000]);
hold on;
grid on;
plot(t2,drehspec20);
ylabel('Drehzahl');
xlabel('Zeit in s');
legend('Mittels Nullgaenge','Mittels Spectrogramm','Location','SouthEast');


specfreq30=SpecToFreq(tacho30,hamming(1028),1000, 7500, 40000);
t1 = linspace(0,3,length(freq30));
t2 = linspace(0,3,length(specfreq30));

drehzeit30 = 60*(freq30/8);
drehspec30 = 60*(specfreq30/8);
figure(13)
plot(zeit30,drehzeit30);
title('Versorgungsspannung 30 V');
ylim([0 4500]);
hold on;
grid on;
plot(t2,drehspec30);
ylabel('Drehzahl');
xlabel('Zeit in s');
legend('Mittels Nullgaenge','Mittels Spectrogramm','Location','SouthEast');


specfreq40=SpecToFreq(tacho40,hamming(1028),1000, 7500, 40000);
t1 = linspace(0,3,length(freq40));
t2 = linspace(0,3,length(specfreq40));

drehzeit40 = 60*(freq40/8);
drehspec40 = 60*(specfreq40/8);
figure(14)
plot(zeit40,drehzeit40);
title('Versorgungsspannung 40 V');
ylim([0 5500]);
hold on;
grid on;
plot(t2,drehspec40);
ylabel('Drehzahl');
xlabel('Zeit in s');
legend('Mittels Nullgaenge','Mittels Spectrogramm','Location','SouthEast');


specfreq50=SpecToFreq(tacho50,hamming(1028),1000, 7500, 40000);
t1 = linspace(0,3,length(freq50));
t2 = linspace(0,3,length(specfreq50));

drehzeit50 = 60*(freq50/8);
drehspec50 = 60*(specfreq50/8);
figure(15)
plot(zeit50,drehzeit50);
title('Versorgungsspannung 50 V');
ylim([0 6800]);
hold on;
grid on;
plot(t2,drehspec50);
ylabel('Drehzahl');
xlabel('Zeit in s');
legend('Mittels Nullgaenge','Mittels Spectrogramm','Location','SouthEast');




