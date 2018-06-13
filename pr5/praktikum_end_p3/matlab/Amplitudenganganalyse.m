max10 = max(hz10) - min(hz10);
max100 = max(hz100)- min(hz100);
max500 = max(hz500) - min(hz500);
max1000 = max(hz1000)- min(hz1000);
max2000 = max(hz2000)- min(hz2000);
max3000 = max(hz3000)- min(hz3000);
max4000 = max(hz4000)- min(hz4000) ;
max5000 = max(hz5000) - min(hz5000);
max6000 = max(hz6000) - min(hz6000);
max7000 = max(hz7000) - min(hz7000);
max8000 = max(hz8000) - min(hz8000);
max9000 = max(hz9000) - min(hz9000);
max10000 = max(hz10000) - min(hz10000);

volt10 = Code2Volt(max10,65.5549,-9.8077);
volt100 = Code2Volt(max100,65.5549,-9.8077);
volt500 = Code2Volt(max500,65.5549,-9.8077);
volt1000 = Code2Volt(max1000,65.5549,-9.8077);
volt2000 = Code2Volt(max2000,65.5549,-9.8077);
volt3000 = Code2Volt(max3000,65.5549,-9.8077);
volt4000 = Code2Volt(max4000,65.5549,-9.8077);
volt5000 = Code2Volt(max5000,65.5549,-9.8077);
volt6000 = Code2Volt(max6000,65.5549,-9.8077);
volt7000 = Code2Volt(max7000,65.5549,-9.8077);
volt8000 = Code2Volt(max8000,65.5549,-9.8077);
volt9000 = Code2Volt(max9000,65.5549,-9.8077);
volt10000 = Code2Volt(max10000,65.5549,-9.8077);

U_aus = [volt10, volt100, volt500, volt1000, volt2000, volt3000, volt4000, volt5000, volt6000, volt7000, volt8000, volt9000, volt10000];

A=20.*log10(U_aus./14);

freq_vec = logspace(0,5,length(A));

frequenz=[10,100,500,1000,2000,3000,4000,5000,6000,7000,8000,9000,10000];

semilogx(frequenz,A)
