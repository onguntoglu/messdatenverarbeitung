function HM8150_close(s)
% function HM8150_close(s)
% ---------------------------------------------------
% filename: HM8150_close
% author: Jürgen Funck
% organisation: TU Berlin
% project: MDV PR
% date: 2012-04-27
% ---------------------------------------------------
% description: shutdown serial connection to HM8150
%   Function generator
% input: 
%   s:   handle to serial connection
% ---------------------------------------------------
    fprintf(s,'OT0');   % turn off output
    fprintf(s,'RM0');   % terminate remote connection
    fclose(s);
end