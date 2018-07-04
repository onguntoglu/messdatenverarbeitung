function [freqgang, nullgang] = hzchirpzeit(sig, t)
%Eingaenge; sig = Eingangssignal, t = Zeit des Signals
%Ausgaenge; nullgang = Vektor, der die index der Nullgaenge enthaelt
%           freqgang = Vektor, der die Frequenz f?r ein Period eines
%           Sinus-Signals enthaelt


signal = sig;

i = 0;

for k = 1:1:length(signal);  %Index der Nulldurchgaenge finden 
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



%Erste Frequenz f?r die 3/4 Periode speichern
%f?r die Optimisierung der Funktion
%sonst wird in der naechste Schleife 
%die 3/4 Periodenteil am Anfang nicht gespeichtert

erstenullgang = nullgang(1);
ersteperiode = (4/3)*(t(erstenullgang)-t(1)); %Die 3/4 Periodenanteil wird mit 
                    %4/3 multipliziert f?r eine  angenommene gesamte Periode
                                          
                                        
erstefreq = 1/ersteperiode;
freqgang = zeros(1,length(nullgang)/2+1);
freqgang(1) = erstefreq;




for k = 1:1:length(nullgang)/2 
    %mittels Nulldurchgaenge die Periodendauer
    %jede Sin-Signal berechnen     
    
    
    nullzwei = nullgang(2*k); %Ende eines Sin-Signals
    nullerst = nullgang(2*k -1); %Anfang eines Sin-Signals
    
 periodendauer =  t(nullzwei) - t(nullerst); %Berechnet die Zeit zwischen dem
                                             %Anfang und Ende eines Sin-Signals
                                             %Also die Periodendauer
 
 freqgang(k+1) = 1/periodendauer;  %Die Periodendauer in Frequenz umwandeln 
                                 %und in dem Vektor freqgang speichern
 
end


end

