%Somesh Ganesh, Audio Bandwidth Extension
%Function to generate harmonics using a NLD

%Inputs - highest octave of audio signal, sampling frequency, spectrogram
%axis for reference
%Output - Signal after generating harmonics
function anld = harGen(audio1,fs,ax)
%%
%Test case
% [y,fs] = audioread('E:\GaTech\GTCMT\Fall 2016\7100\Untouchable Chords.wav');
% ysig = y(250000:450000,1);
audio = audio1';
%%
%Half wave rectifier
% anld = audio.*((sign(audio)+1)/2);
%%
%Full wave rectifier
anld = audio.*sign(audio);
%%
figure;
spectrogram(anld,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Signal after NLD');

end