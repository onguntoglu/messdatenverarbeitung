function [alpha, phaszeit] = stromanschnittswinkel(signal,sigfreq)

%   Berechnet die Anschnittswinkel aus den aufgenommenen Daten
%   signal ist der Vektor, der den Stromverlauf enth?lt
%   alpha gibt den Anschnittswinkel vom signal
%   phaszeit gibt die Daur des Anschnitts in millisekunden
%   In unserer Messungen: 
%   sigfreq = 50 Hz
%   anzahlmesswerte = 1000
%   abtastfreq = 5000 Hz



werte = Code2Volt(signal,65.5549,-9.8077); %Messungen in Spannungswerte r?ckwandeln
strom = werte'.*(0.9/10); %Mit Stromfaktor multiplizieren
anzahlmesswerte = length(signal); 
abtastfreq = sigfreq*anzahlmesswerte;
signaldauer = anzahlmesswerte*(1/abtastfreq);
periodenanzahl = signaldauer/(1/sigfreq); %gesamte ganzzahlige Periodananzahl 

counter = 1;
nulltime = 0;

while(counter<(length(strom)/(periodenanzahl*2))) %(length(strom)/(periodenanzahl*2)), gibt die halbe Periodendauer
 if(-0.05<strom(counter)) && (strom(counter)<0.05) %Schwelle f?r Anschnittsphase
    
 nulltime = nulltime+1;
 end
 counter = counter+1;
end    

phaszeit = 1000*nulltime * (1/abtastfreq); 
alpha = ((nulltime*(1/abtastfreq))/((1/sigfreq)/2))*180;
end

