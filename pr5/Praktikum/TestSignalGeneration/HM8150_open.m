function s=HM8150_open(port)
% function s=HM8150_open(port)
% ---------------------------------------------------
% filename: HM8150_open
% author: Jürgen Funck
% organisation: TU Berlin
% project: MDV PR
% date: 2012-04-27
% ---------------------------------------------------
% description: open serial connection to HM8150
%   Function generator
% input: 
%   port:   name of serial port to use, e.g. 'COM2'
%
% output:   handle to serial connection
%
% ---------------------------------------------------
    s = serial(port);
    set(s,'BaudRate',9600);
    set(s,'Terminator','CR');
    fopen(s);
    
    % empty buffer of com-port
    if(s.BytesAvailable > 0)
        fread(s, s.BytesAvailable);
    end
    
    HM8150_command(s,'RST');  % reset device
    fprintf(s,'RM1');              % put device into remote mode
end