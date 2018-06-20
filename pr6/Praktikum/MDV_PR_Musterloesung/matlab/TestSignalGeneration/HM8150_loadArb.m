function HM8150_loadArb(s,x)
% function HM8150_loadArb(s,x)
% ---------------------------------------------------
% filename: HM8150_loadArb.m
% author: Jürgen Funck
% organisation: TU Berlin
% project: MDV PR
% date: 2014-05-26
% ---------------------------------------------------
% description: loads a new arbitrary signal into the 
%               HM8150 function generator
% input: 
%   s:  handle to serial connection
%   x:  signal to load
%
% The length of the signal has to bee exactly 4096.
% Values have to be integer values in the range -2047,2047
% ---------------------------------------------------
N = 4096;   % number of data-points
MAX = 2047; % maximum allowed input value
MIN = -2047;% maximum allowed output value

% check input signal
if(length(x) ~= N)
    error('Illegal signal length %i! The signal has to have exactly %i elements!',...
        length(x),N);
end

if((max(x) > MAX) || (min(x) < MIN))
    error('Input signal out of range! Has to be in rage [%i,%i]',MIN,MAX);
end

% convert signal to integer
x = int16(x);

% upload signal
fprintf(1,'uploading arb. signal\n');
HM8150_command(s,'ARC4');
for i=1:N
    HM8150_command(s,sprintf('ARP4:%i=%i',i-1,x(i)));
    pause(0.02)
    
    if(mod(i,8)==0)
        fprintf(1,'.');
        
        if(mod(i,512)==0)
            fprintf(1,'%i/%i\n',i,N);
        end
    end
end

HM8150_command(s,'ARE');
HM8150_command(s,'ARB4');

end