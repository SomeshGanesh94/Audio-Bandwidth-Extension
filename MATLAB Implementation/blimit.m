%Function to generate band limited audio signal
%Inputs - audio samples, sampling frequency, spectrogram axis for reference
%Output - band limited audio

function [alim] = bLimit(audio,fs,ax)

d = designfilt('lowpassiir', 'PassbandFrequency', fs/6, ...
    'StopbandFrequency', fs/6+500, 'PassbandRipple', 3, ...
    'StopbandAttenuation', 60, 'SampleRate', fs, ...
    'DesignMethod', 'butter');

% d = designfilt('lowpassiir', 'PassbandFrequency', fs/4, ...
%     'StopbandFrequency', fs/4+500, 'PassbandRipple', 3, ...
%     'StopbandAttenuation', 60, 'SampleRate', fs, ...
%     'DesignMethod', 'butter');

alim = filtfilt(d,audio);

figure;
spectrogram(alim,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Bandlimited signal');

end