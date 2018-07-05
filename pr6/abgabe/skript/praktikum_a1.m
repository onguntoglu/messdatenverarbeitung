load('hz_values.mat')

max10 = max(hz10(1:750)) - min(hz10(1:750));
max100 = max(hz100(1:750))- min(hz100(1:750));
max500 = max(hz500(1:750)) - min(hz500(1:750));
max600 = max(hz600(1:750)) - min(hz600(1:750));
max700 = max(hz700(1:750)) - min(hz700(1:750));
max800 = max(hz800(1:750)) - min(hz800(1:750));
max900 = max(hz900(1:750)) - min(hz900(1:750));
max1000 = max(hz1000(1:750))- min(hz1000(1:750));
max1100 = max(hz1100(1:750))- min(hz1100(1:750));
max1200 = max(hz1200(1:750))- min(hz1200(1:750));
max1300 = max(hz1300(1:750))- min(hz1300(1:750));
max1400 = max(hz1400(1:750))- min(hz1400(1:750));
max1500 = max(hz1500(1:750))- min(hz1500(1:750));
max1600 = max(hz1600(1:750))- min(hz1600(1:750));
max1700 = max(hz1700(1:750))- min(hz1700(1:750));
max1800 = max(hz1800(1:750))- min(hz1800(1:750));
max1900 = max(hz1900(1:750))- min(hz1900(1:750));
max2000 = max(hz2000(1:750))- min(hz2000(1:750));
max3000 = max(hz3000(1:750))- min(hz3000(1:750));
max4000 = max(hz4000(1:750))- min(hz4000(1:750)) ;
max5000 = max(hz5000(1:750)) - min(hz5000(1:750));
max6000 = max(hz6000(1:750)) - min(hz6000(1:750));
max7000 = max(hz7000(1:750)) - min(hz7000(1:750));
max8000 = max(hz8000(1:750)) - min(hz8000(1:750));
max9000 = max(hz9000(1:750)) - min(hz9000(1:750));
max10000 = max(hz10000(1:750)) - min(hz10000(1:750));
max11000 = max(hz11000(1:750)) - min(hz11000(1:750));
max12000 = max(hz12000(1:750)) - min(hz12000(1:750));
max13000 = max(hz13000(1:750)) - min(hz13000(1:750));
max14000 = max(hz14000(1:750)) - min(hz14000(1:750));
max15000 = max(hz15000(1:750)) - min(hz15000(1:750));

volt10 = Code2Volt(max10,65.5549,-9.8077);
volt100 = Code2Volt(max100,65.5549,-9.8077);
volt500 = Code2Volt(max500,65.5549,-9.8077);
volt600 = Code2Volt(max600,65.5549,-9.8077);
volt700 = Code2Volt(max700,65.5549,-9.8077);
volt800 = Code2Volt(max800,65.5549,-9.8077);
volt900 = Code2Volt(max900,65.5549,-9.8077);
volt1000 = Code2Volt(max1000,65.5549,-9.8077);
volt1100 = Code2Volt(max1100,65.5549,-9.8077);
volt1200 = Code2Volt(max1200,65.5549,-9.8077);
volt1300 = Code2Volt(max1300,65.5549,-9.8077);
volt1400 = Code2Volt(max1400,65.5549,-9.8077);
volt1500 = Code2Volt(max1500,65.5549,-9.8077);
volt1600 = Code2Volt(max1600,65.5549,-9.8077);
volt1700 = Code2Volt(max1700,65.5549,-9.8077);
volt1800 = Code2Volt(max1800,65.5549,-9.8077);
volt1900 = Code2Volt(max1900,65.5549,-9.8077);
volt2000 = Code2Volt(max2000,65.5549,-9.8077);
volt3000 = Code2Volt(max3000,65.5549,-9.8077);
volt4000 = Code2Volt(max4000,65.5549,-9.8077);
volt5000 = Code2Volt(max5000,65.5549,-9.8077);
volt6000 = Code2Volt(max6000,65.5549,-9.8077);
volt7000 = Code2Volt(max7000,65.5549,-9.8077);
volt8000 = Code2Volt(max8000,65.5549,-9.8077);
volt9000 = Code2Volt(max9000,65.5549,-9.8077);
volt10000 = Code2Volt(max10000,65.5549,-9.8077);
volt11000 = Code2Volt(max11000,65.5549,-9.8077);
volt12000 = Code2Volt(max12000,65.5549,-9.8077);
volt13000 = Code2Volt(max13000,65.5549,-9.8077);
volt14000 = Code2Volt(max14000,65.5549,-9.8077);
volt15000 = Code2Volt(max15000,65.5549,-9.8077);

U_aus = [volt10, volt100, volt500, volt600, volt700, volt800, volt900, volt1000, volt1100, volt1200, volt1300, volt1400, volt1500, volt1600,volt1700,volt1800,volt1900,volt2000, volt3000, volt4000, volt5000, volt6000, volt7000, volt8000, volt9000 , volt10000 , volt11000 , volt12000 , volt13000 , volt14000 , volt15000];

A=20.*log10(U_aus./14);

frequenz=[10,100,500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,3000,4000,5000,6000,7000,8000,9000,10000,11000,12000,13000,14000,15000];

figure(1);
plot(frequenz,A)
xlabel('Frequenz in Hz');
ylabel('Amplitudengang in dB');
title('Amplitudenfrequenzgang');
grid on;
