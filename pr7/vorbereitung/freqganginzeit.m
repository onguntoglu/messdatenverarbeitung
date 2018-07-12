function [freqgang, nullgang, zeit] = freqganginzeit(sig, t)
%Eingaenge; sig = Eingangssignal, t = Zeitvektor des Signals
%Ausgaenge; nullgang = Vektor, der die index der Nullgaenge enthaelt
%           freqgang = Vektor, der die Frequenz f?r ein Period eines
%           Sinus-Signals enthaelt
signal = sig;
i = 0;
for k = 1:1:length(signal)-1;  %Index der Nulldurchgaenge finden 
                             %und in einem Vektor nullgang speichern
    if(signal(k) < 0 && signal(k+1) > 0)
       i = i+1;
      nullgang(i) = k;    
    end
end

%Plot zur Kontrolle der Nulldurchgaenge
plot(t,signal);
hold on;
for k = 1:1:length(nullgang)
   plot(t(nullgang(k)),signal(nullgang(k)),'x')
   hold on;
end
xlabel('Zeit in s');
ylabel('Amplitude');

for k = 1:1:length(nullgang)/2 
    %mittels Nulldurchgaenge die Periodendauer
    %jede Sin-Signal berechnen     
    nullzwei = nullgang(2*k); %Ende eines Sin-Signals
    nullerst = nullgang(2*k -1); %Anfang eines Sin-Signals  
 periodendauer =  t(nullzwei) - t(nullerst);%Berechnet die Zeit zwischen dem
 zeit(k)=t(nullerst);                                           %Anfang und Ende eines Sin-Signals
                                             %Also die Periodendauer
 freqgang(k) = 1/periodendauer;  %Die Periodendauer in Frequenz umwandeln 
                                 %und in dem Vektor freqgang speichern 
end
end
