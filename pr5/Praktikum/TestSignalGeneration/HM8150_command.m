function HM8150_command(s,cmd)
% function FLUKE_command(s,cmd)
% ---------------------------------------------------
% filename: FLUKE_command
% author: Jürgen Funck
% organisation: TU Berlin
% project: MDV PR
% date: 2012-04-27
% ---------------------------------------------------
% description: send command to HM8150 function generator
% input: 
%   s:      handle to serial connection
%   cmd:    command to send   
% ---------------------------------------------------
    fprintf(s,cmd);
end