function RMSxt = EffektivwertZeitbereich(xt)

RMSxt = sqrt((1/length(xt))*sum(power(xt,2)));

end

