%% 2.Aufgabe- Angeschnittenen Strom

function i = stromPhasSchnitt(id, f, alpha, t)

% % description: simuliert einen mit dem Winkel alpha angeschnittenen Strom
% % input: id - Amplitude des Stroms
% %        f  - Frequenz des Stroms
% %     alpha - Anschnittswinkel [rad], zwischen 0 und pi
% %         t - Vektor mit den Zeitpunkten
% %
% % output: i - zeitlicher Verlauf des Stroms

anschnitt = alpha/pi; 

i = id*sin(2*pi*f*t);

T = 1/f;

counter = 1 ;

while (counter < length(t))
    if (mod(t(counter),T/2) < anschnitt*T/2)
        i(counter) = 0;  
    end
    counter = counter + 1;

end
