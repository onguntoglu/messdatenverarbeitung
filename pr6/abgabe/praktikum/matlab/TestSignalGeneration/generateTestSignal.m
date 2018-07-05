% This script generates a 440 Hz sinewave with additive noise using the
% arbitrary function of a HAMEG HM8150 function generator connected via a
% (virtual) COM-port.
%
% You may need to change the COM-port (variable port in line 18)
% to connect to the function generator on your computer.
%
% To run this scrit simply type generateTestSignal on the command matlab
% command line.
%

clear all;
close all;
instrreset
clc;

% parameters
port    = 'COM3';

% load signal
load('Sine440Hz_Noised.mat')

% connect
hm = HM8150_open(port);

% setup arb. signal
HM8150_loadArb(hm,x);       % load arbitrary signal
HM8150_command(hm,'CTM');   % free running mode
HM8150_command(hm,'SW0');   % no sweep
HM8150_command(hm,'AMP:14');% amplitude: +- 7 V
HM8150_command(hm,'OFS:0'); % offset: 0
HM8150_setFRQ(hm,440);       % frequency 50 Hz

HM8150_command(hm,'OT1');   % turn on output
fprintf(1,'Ouput on\n');