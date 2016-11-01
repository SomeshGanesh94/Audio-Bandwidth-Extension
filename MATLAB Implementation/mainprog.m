%Somesh Ganesh, Audio Bandwidth Extension
%Main program

clc;
close all;
clear all;

[y,fs] = audioread('E:\GaTech\GTCMT\Fall 2016\7100\Untouchable Chords.wav');
audio = y(250000:450000,:);

% t=0:(1/44100):3;
% audio=sin(2*pi*2000*t) + sin(2*pi*4000*t);% + (1/3)*sin(2*pi*12000*t) %+ (1/4)*sin(2*pi*16000*t);
% fs=44100;

figure;
spectrogram(audio(:,2),hamming(1024),512,1024,fs,'yaxis'); %Plot spectrogram of original signal
ax = caxis;
title('Original signal');
%%
%Function to band limit the audio signal
alim = bLimit(audio(:,2),fs,ax); 
%Inputs - audio sample, sampling frequency, spectrogram axis for reference
%Output - band limited audio
%%
%Bandwidth Extension using a half or full wave rectifier as the NLD
%component
afin = rectFunc(alim,fs,ax);
%Inputs - band limited audio, sampling frequency, spectrogram axis for
%reference 
%Output - final reconstructed audio
%%
%Time Plotting section
timePlot(audio(:,2),alim,afin);