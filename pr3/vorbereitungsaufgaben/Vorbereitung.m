%% 1.Aufgabe - Sinussignal bilden    
phi = pi/3;
f= 50;
t = linspace(0,1,1000);
i_d = 5;
signal = i_d*sin(2*pi*f*t + phi);

h = figure();
plot(t,signal);
set(h,'DefaultAxesFontSize',20);
set(h,'DefaultTextFontSize',20);
set(h,'DefaultLineMarkersize',18);
set(h,'DefaultLineLineWidth',2);
xlabel('Zeit');
ylabel('Amplitude');

%% Fenstern - Leckeffekt

K = find(signal==4.89106467566604);

% shift = (180/3)/(2*180*f);
% period = 1/f;
% period1 = period - shift;
% periodlast = 1-shift;
% 
% index1= period1*10000;
% indexlast = periodlast*10000;
% 
% timefenster = t(index1:indexlast);
% signalfenster = signal(index1:indexlast);
% 
% plot(timefenster,signalfenster);
% 



%% Amplitude und Phase mit DFT bestimmen

DFT = fft(signal);
Amp = 20*log10(abs(DFT));
Phase = unwrap(angle(DFT));

f = (0:length(DFT)-1)*100/length(DFT);        % Frequency vector

subplot(2,1,1)
plot(f,Amp)
title('Magnitude')
xlabel('Frequency in rad/s');
ylabel('Amplitudengang in dB');
ax = gca;
ax.XTick = [5 15 30 45 60 75 90 95];
set(h,'DefaultAxesFontSize',20);
set(h,'DefaultTextFontSize',20);
set(h,'DefaultLineMarkersize',18);
set(h,'DefaultLineLineWidth',2);
grid on;


subplot(2,1,2)
plot(f,Phase)
title('Phase')
xlabel('Frequency in rad/s');
ylabel('Phasengang');
ax = gca;
ax.XTick = [5 15 30 45 60 75 90 95];
set(h,'DefaultAxesFontSize',20);
set(h,'DefaultTextFontSize',20);
set(h,'DefaultLineMarkersize',18);
set(h,'DefaultLineLineWidth',2);
grid on;
 
%% Aufgabe 3


i45 = stromPhasSchnitt(5,50,pi/4,t);
i60 = stromPhasSchnitt(5,50,pi/3,t);

DFT45 = fft(i45);
Amp45 = 20*log10(abs(DFT45));
Phase45 = unwrap(angle(DFT45));

f45 = (0:length(DFT45)-1)*100/length(DFT45);        % Frequency vector


h = figure();
subplot(2,1,1)
plot(f45,Amp45)
title('Magnitude');
xlabel('Frequency in Hz');
ylabel('Amplitudengang in dB');
ax = gca;
ax.XTick = [5 15 30 45 60 75 90 95];
grid on;


subplot(2,1,2)
plot(f45,Phase45)
title('Phase');
xlabel('Frequency in Hz');
ylabel('Phasengang');
ax = gca;
ax.XTick = [5 15 30 45 60 75 90 95];
grid on;

DFT60 = fft(i60);
Amp60 = 20*log10(abs(DFT60));
Phase60 = unwrap(angle(DFT60));

f60 = (0:length(DFT60)-1)*100/length(DFT60);        % Frequency vector


g = figure();
subplot(2,1,1)
plot(f60,Amp60)
title('Magnitude');
xlabel('Frequency in Hz');
ylabel('Amplitudengang in dB');
ax = gca;
ax.XTick = [5 15 30 45 60 75 90 95];
grid on;


subplot(2,1,2)
plot(f60,Phase60)
title('Phase');
xlabel('Frequency in Hz');
ylabel('Phasengang');
ax = gca;
ax.XTick = [5 15 30 45 60 75 90 95];
grid on;



