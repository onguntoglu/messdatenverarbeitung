function output = SpecToFreq(signal, window, fs)
    [s, f, t] = spectogram(signal, window, fs);
    
    dummy_vec = zeros(1,length(s(:,1)));
    for i=1:length(s(1,:)) % first column contain frequencies
        val = s(:,i);      % i-tes Element
        abs_val = abs(val); % abs of complex number
        [~, id] = max(abs_val);
        frequenz = f(id);
        dummy_vec(i) = frequenz;
    end
    
    output = dummy_vec;
end

