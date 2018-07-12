motor1 = load('MotorStrom_10V_100kS.mat');
motor2 = load('MotorStrom_20V_100kS.mat');
motor3 = load('MotorStrom_30V_100kS.mat');

%Versorgungsspannungen f?r Motor1,2,3
V1 = 10;
V2 = 20;
V3 = 30;
%Abtastrate fuer alle Motore
fs = 100000;

%Strom und Tacho Matrize speichern
strom1 = motor1.strom;
tacho1 = motor1.tacho;
strom2 = motor2.strom;
tacho2 = motor2.tacho;
strom3 = motor3.strom;
tacho3 = motor3.tacho;


%Amp-Spektrum f?r Motorstrom 1
DFT1 = fft(strom1);
n = length(strom1);
Amp1 = abs(DFT1)/n;
f = (0:n-1)*(fs/(n-1));
figure(1)
plot(f,Amp1);
title('Amplitudenspektrum fuer Motorstrom 1');
xlabel('Frequency in Hz');
ylabel('Amplitude');

%Amp-Spektrum f?r Motorstrom 2
DFT2 = fft(strom2);
n = length(strom2);
Amp2 = abs(DFT2)/n;
f = (0:n-1)*(fs/(n-1));
figure(2)
plot(f,Amp2);
title('Amplitudenspektrum fuer Motorstrom 2');
xlabel('Frequency in Hz');
ylabel('Amplitude');

%Amp-Spektrum f?r Motorstrom 2
DFT3 = fft(strom3);
n = length(strom3);
Amp3 = abs(DFT3)/n;
f = (0:n-1)*(fs/(n-1));
figure(3)
plot(f,Amp3);
title('Amplitudenspektrum fuer Motorstrom 3');
xlabel('Frequency in Hz');
ylabel('Amplitude');

[maxstrom1 indexmaxstrom1] = max(Amp1);
[maxstrom2 indexmaxstrom2] = max(Amp2);
[maxstrom3 indexmaxstrom3] = max(Amp3);

drehmotorstrom1 = round(60*(f(indexmaxstrom1)/18));
drehmotorstrom2 = round(60*(f(indexmaxstrom2)/18));
drehmotorstrom3 = round(60*(f(indexmaxstrom3)/18));

%Amp-Spektrum f?r Motortacho 1
DFT1 = fft(tacho1);
n = length(tacho1);
Amp1tacho = abs(DFT1)/n;
f = (0:n-1)*(fs/(n-1));
figure(4)
plot(f,Amp1tacho);
title('Amplitudenspektrum fuer Motortacho 1');
xlabel('Frequency in Hz');
ylabel('Amplitude');

%Amp-Spektrum f?r Motortacho 2
DFT2 = fft(tacho2);
n = length(tacho2);
Amp2tacho = abs(DFT2)/n;
f = (0:n-1)*(fs/(n-1));
figure(5)
plot(f,Amp2tacho);
title('Amplitudenspektrum fuer Motortacho 2');
xlabel('Frequency in Hz');
ylabel('Amplitude');

%Amp-Spektrum f?r Motortacho 2
DFT3 = fft(tacho3);
n = length(tacho3);
Amp3tacho = abs(DFT3)/n;
f = (0:n-1)*(fs/(n-1));
figure(6)
plot(f,Amp3tacho);
title('Amplitudenspektrum fuer Motortacho 3');
xlabel('Frequency in Hz');
ylabel('Amplitude');

[maxtacho1 indexmaxtacho1] = max(Amp1tacho);
[maxtacho2 indexmaxtacho2] = max(Amp2tacho);
[maxstrom3 indexmaxtacho3] = max(Amp3tacho);

drehmotortacho1 = round(60*(f(indexmaxtacho1)/8));
drehmotortacho2 = round(60*(f(indexmaxtacho2)/8));
drehmotortacho3 = round(60*(f(indexmaxtacho3)/8));



