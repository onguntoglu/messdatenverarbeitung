function HM8150_setFRQ(serFun,f)
% function HM8150_setFRQ(serFun,f)
% ---------------------------------------------------
% filename: HM8150_setFRQ
% author: Jürgen Funck
% organisation: TU Berlin
% project: MDV PR
% date: 2012-04-27
% ---------------------------------------------------
% description: set frequency of HM8150 Function generator
% input: 
%   serFun: handle to serial connection
%   f:      frequency [Hz]
% ---------------------------------------------------
    % set frequency at function generator
    HM8150_command(serFun,sprintf('FRQ:%.4f',f));
end