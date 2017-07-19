%Somesh Ganesh
%Audio Bandwidth Extension, Fall 2016
%Main Program

clc;
close all;
clear all;

%%
%Choosing input track

tin = input('Choose a track from 1 - 5 ');

%Define path for each file accordingly
%A random subset of 2 seconds are randomly chosen from the track chosen
switch(tin)
    case 1
        [y,fs] = audioread('Untouchable Chords.wav');
        subsetaudio = y(88200:882000+88200,:);
        monoaudio = subsetaudio(:,1);
        audio = normalizeIntensityLevel(monoaudio, fs);
    case 2
        [y,fs] = audioread('Phoenix_ScotchMorris_MIX.wav');
        subsetaudio = y(3528000:3528000+882000,:);
        monoaudio = subsetaudio(:,1);
        audio = normalizeIntensityLevel(monoaudio, fs);
    case 3
        [y,fs] = audioread('LizNelson_Rainfall_MIX.wav');
        subsetaudio = y(2646000:2646000+882000,:);
        monoaudio = subsetaudio(:,1);
        audio = normalizeIntensityLevel(monoaudio, fs);
    case 4
        [y,fs] = audioread('01 - Pull Me Under.wav');
        subsetaudio = y(10804500:10804500+882000,:);
        monoaudio = subsetaudio(:,1);
        audio = normalizeIntensityLevel(monoaudio, fs);
    case 5
        [y,fs] = audioread('Invisible Children (KSHMR Remix) 1.0.wav');
        subsetaudio = y(1102500:1102500+882000,:);
        monoaudio = subsetaudio(:,1);
        audio = normalizeIntensityLevel(monoaudio, fs);
end

figure;
spectrogram(audio,hamming(1024),512,1024,fs,'yaxis'); %Plot spectrogram of original signal
ax = caxis; %Maintain same axis for all spectrograms
title('Original signal');
%%
%Function to band limit the audio signal
alim = bLimit(audio,fs,ax);
%%
%Function for bandwidth extension
afin = bwe(alim,fs,ax);

listeninput = input('\nWhich track do you want to listen to?\n1)Original\n2)Bandlimited\n3)BWE output\4)Exit\nEnter your choice here: ');

while(listeninput != 4)
    switch listeninput
        case 1
            soundsc(audio,fs);
        case 2
            soundsc(alim,fs);
        case 3
            soundsc(afin,fs);
        case 4
            break;
        otherwise
            print('\nInvalid choice, please try again');
    end
end