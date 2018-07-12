function output = SpecToFreq(signal, window, noverlap, f ,fs)
    [s, f, t] = spectrogram(signal, window, noverlap,f, fs);
    
    dummy_vec = zeros(1,length(s(:,1))); %zeros for number of rows
    for i=1:length(s(1,:)) % i = 1:number of columns
        val = s(:,i);      % i-tes Column
        abs_val = abs(val); % abs of complex number
        [~, id] = max(abs_val);
        frequenz = f(id);
        dummy_vec(i) = round(frequenz);
    end
    
    output = dummy_vec;
end

