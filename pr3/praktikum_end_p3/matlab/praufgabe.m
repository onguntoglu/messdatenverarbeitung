%aduwerte12ms , 1.2 ms in Oszi -> Stromeffektivwert 0.275332A
%aduwerte34ms , 3.4 ms in Oszi -> Stromeffektivwert 0.253212A
%aduwerte62ms , 6.2 ms in Oszi -> Stromeffektivwert 0.185541A

% gemessene Phasenwinkel vom Oszilloskop:
%f?r aduwerte12ms
alpha12msoszi = (1.2/10)*180; %= 21.6
%f?r aduwerte34ms
alpha34msoszi = (3.4/10)*180; %= 61.2
%f?r aduwerte62ms
alpha62msoszi = (6.2/10)*180; %= 111.6


%SpannungToStrom-Faktor -> Vi = 10V/0.9A
%aduwerte Code2Volt -> SpannungToStrom-Faktor -> MATLAB-Funktion benutzen

%Phasenzeit->Anschnittswinkel:(Phasenzeit/Halbe-Periodenzeit)*180

werte12ms = Code2Volt(aduwerte12ms,65.5549,-9.8077);
werte34ms = Code2Volt(aduwerte34ms,65.5549,-9.8077);
werte62ms = Code2Volt(aduwerte62ms,65.5549,-9.8077);

strom12ms = werte12ms'.*(0.9/10);
strom34ms = werte34ms'.*(0.9/10);
strom62ms = werte62ms'.*(0.9/10);

zeit = (1/5000) * linspace(1,1000,1000);

subplot(3,1,1)
plot(zeit,strom12ms);
grid on;
title('Phasenzeit 1.2ms');
ylabel('Strom in [A]');
xlabel('Zeit in s');
subplot(3,1,2)
plot(zeit,strom34ms);
grid on;
title('Phasenzeit 3.4ms');
ylabel('Strom in [A]');
xlabel('Zeit in s');
subplot(3,1,3)
plot(zeit,strom62ms);
grid on;
title('Phasenzeit 6.2ms');
ylabel('Strom in [A]');
xlabel('Zeit in s');

[alpha12ms, phaszeit12ms] = stromanschnittswinkel(aduwerte12ms,50);
[alpha34ms, phaszeit34ms] = stromanschnittswinkel(aduwerte34ms,50);
[alpha62ms, phaszeit62ms] = stromanschnittswinkel(aduwerte62ms,50);

disp('Am Oszlilloskop gemessene Phasenwinkel von 3 Signalen sind:')
disp('Fuer das Signal mit 1.2 ms Phasenanschnittszeit =');
disp(alpha12msoszi);
disp('im Matlab berechnete Phasenanschnittzeit und Winkel');
disp(phaszeit12ms); disp(alpha12ms);

disp('Fuer das Signal mit 3.4 ms Phasenanschnittszeit')
disp(alpha34msoszi);
disp('im Matlab berechnete Phasenanschnittzeit und Winkel');
disp(phaszeit34ms); disp(alpha34ms);

disp('Fuer das Signal mit 6.2 ms Phasenanschnittszeit')
disp(alpha62msoszi);
disp('im Matlab berechnete Phasenanschnittzeit und Winkel');
disp(phaszeit62ms); disp(alpha62ms);


