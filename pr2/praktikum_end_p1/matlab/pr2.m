%% Aufgabe 1 - Gleichspannung ADU
aduwerte_a1 = ucAnalogRead('COM7',5000,1000,'NONE',0,'OFF');
plot(aduwerte_a1)
%% Aufgabe 2 - Dreiecksignal ADU
clf
aduwerte_a2 = ucAnalogRead('COM7',5000,1000,'NONE',0,'OFF');
plot(aduwerte_a2)
% steigende Flanke
[min_aduwerte2, index_min_aduwerte2] = min(aduwerte_a2);
i = 0;
while(aduwerte_a2(index_min_aduwerte2 + i) < aduwerte_a2(index_min_aduwerte2 + i + 1))
    i = i + 1;    
end
clf
flanke = aduwerte_a2(index_min_aduwerte2: index_min_aduwerte2 + i);
plot(flanke)
save('aduwerte_a2.mat', 'aduwerte_a2');
save('flanke.mat', 'flanke');


