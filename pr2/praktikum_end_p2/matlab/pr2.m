%% Aufgabe 1 - Gleichspannung ADU
aduwerte_a1 = ucAnalogRead('COM7',5000,1000,'NONE',0,'OFF');
%aduwerte_a1_3minus = ucAnalogRead('COM7',5000,1000,'NONE',0,'OFF');
save('aduwerte_a1.mat', 'aduwerte_a1');
%save('aduwerte_a1_3minus.mat', 'aduwerte_a1');
plot(aduwerte_a1)
%% Aufgabe 2 - Dreiecksignal ADU
clear
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
% plot(flanke)
% save('aduwerte_a2.mat', 'aduwerte_a2');
% save('flanke.mat', 'flanke');
x = Code2Volt(flanke,65.5549,-9.8077);
%x = linspace(-7,7,length(flanke));
plot(x,flanke)
grid on
hold on
p = polyfit(x,flanke',1)
steigung_adu = p(1);
offset_adu = p(2);
steigung_theo = 1023/14;
p2 = steigung_theo*x;
plot(x,p2)
title('ADU-Codierung')
xlabel('Spannung in Volt')
ylabel('Binary-Codes')
legend('ADU-real','ADU-ideal')



