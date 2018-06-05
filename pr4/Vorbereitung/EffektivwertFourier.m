function RMSIf = EffektivwertFourier(xt)

DFTxt = fft(xt);
RMSIf = (1/length(DFTxt)) * sum(power(abs(DFTxt),2));

end

