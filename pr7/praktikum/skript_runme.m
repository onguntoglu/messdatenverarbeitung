load('motor.mat');
%% Praktikum Aufgabe 3
mess10strom = mess10.Data.MeasuredData(4).Data;
mess20strom = mess20.Data.MeasuredData(4).Data;
mess30strom = mess30.Data.MeasuredData(4).Data;
mess40strom = mess40.Data.MeasuredData(4).Data;
mess50strom = mess50.Data.MeasuredData(4).Data;
mess10tacho = mess10.Data.MeasuredData(6).Data;
mess20tacho = mess20.Data.MeasuredData(6).Data;
mess30tacho = mess30.Data.MeasuredData(6).Data;
mess40tacho = mess40.Data.MeasuredData(6).Data;
mess50tacho = mess50.Data.MeasuredData(6).Data;

figure(1)
spectrogram(mess10strom,10,8,256,40000,'yaxis')
title('Stromsignal - 10V - mit Hanning-Fenster 10N - Overlap 8 Samples');
saveas(gcf,'mess10strom.png')
figure(2)
spectrogram(mess30strom,10,8,256,40000,'yaxis')
title('Stromsignal - 30V - mit Hanning-Fenster 10N - Overlap 8 Samples');
saveas(gcf,'mess30strom.png')
figure(3)
spectrogram(mess50strom,10,8,256,40000,'yaxis')
title('Stromsignal - 50V - mit Hanning-Fenster 10N - Overlap 8 Samples');
saveas(gcf,'mess50strom.png')
figure(4)
spectrogram(mess10tacho,512,256,256,40000,'yaxis')
title('Tachosignal - 10V - mit Hanning-Fenster 512N - Overlap 256 Samples');
saveas(gcf,'mess10tacho.png')
figure(5)
spectrogram(mess30tacho,512,256,256,40000,'yaxis')
title('Tachosignal - 30V - mit Hanning-Fenster 512N - Overlap 256 Samples');
saveas(gcf,'mess30tacho.png')
figure(6)
spectrogram(mess50tacho,512,256,256,40000,'yaxis')
title('Tachosignal - 50V - mit Hanning-Fenster 512N - Overlap 256 Samples');
saveas(gcf,'mess50tacho.png')
figure(7)
plot(mess10strom)
title('Stromsignal 10V Versorgung');
xlabel('Samples');
ylabel('Amplitude in A');
grid on;
saveas(gcf,'strom10plot.png')
figure(8)
plot(mess10tacho)
title('Tachosignal 10V Versorgung');
xlabel('Samples');
ylabel('Geschwindigkeit');
grid on;
saveas(gcf,'tacho10plot.png')
