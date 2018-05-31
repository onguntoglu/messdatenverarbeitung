function RMSIf = EffektivwertFourier(xt)

DFTxt = fft(xt);
RMSIf = (1/length(DFTxt)) *sqrt(sum(power(abs(DFTxt),2)));

end

