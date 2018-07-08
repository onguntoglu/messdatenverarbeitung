%% Vorbereitung Aufgabe 3

rechteck16 = ones(16,1);
hanning16 = hanning(16);
figure(1)
dft_rechteck16 = Spektrum(rechteck16,ones(1,16)',1,2000,0);
figure(2)
dft_hanning16 = Spektrum(hanning16,ones(1,16)',1,2000,0);
rechteck16_zp = zeros(2^20,1);
rechteck16_zp(1:length(rechteck16)) = rechteck16;
hanning16_zp = zeros(2^20,1);
hanning16_zp(1:length(hanning16)) = hanning16;
figure(3)
dft_rechteck16_zp = Spektrum(rechteck16_zp,ones(1,length(rechteck16_zp))',1,2000,0);
figure(4)
dft_hanning16_zp = Spektrum(hanning16_zp,ones(1,length(hanning16_zp))',1,2000,0);

%% TotalHarmonicDistortion
load('alpha_val.mat');
TotalHarmonicDistortion(alpha0);
TotalHarmonicDistortion(alpha67c68);