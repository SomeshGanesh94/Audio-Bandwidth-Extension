%Somesh Ganesh, Audio Bandwidth Extension
%Main program

clc;
close all;
clear all;

[y,fs] = audioread('E:\GaTech\GTCMT\Fall 2016\7100\Untouchable Chords.wav');
audio = y(250000:450000,:);

figure;
spectrogram(audio(:,2),hamming(1024),512,1024,fs,'yaxis'); %Plot spectrogram of original signal
ax = caxis;
title('Original signal');
%%
%Function to band limit the audio signal
alim = blimit(audio(:,2),fs,ax); 
%Inputs - audio sample, sampling frequency, spectrogram axis for reference
%Output - band limited audio
%%
%Function to generate the highest octave in the signal
afilt1 = filt1(alim,fs,ax);
%Inputs - band limited audio, sampling frequency, spectrogram axis for
%reference
%Output - Signal after the first bandpass filter
%%
%Function to generate harmonics using a NLD
anld = hargen(afilt1,fs,ax);
%Inputs - highest octave of audio signal, sampling frequency, spectrogram
%axis for reference
%Output - Signal after generating harmonics
%%
%Function to filter high frequency content
afilt2 = filt2(anld,fs,ax);
%Inputs - signal after NLD, sampling frequency, spectrogram axis for
%reference
%Output - signal with only high frequency content
%%
%Function to add high frequency content to band limited audio
afin = sigadd(afilt2,alim,fs,ax);
%Inputs - signal with only high frequency content, band limited audio,
%sampling frequency, spectrogram axis for reference
%Output - final bandwidth extended audio
