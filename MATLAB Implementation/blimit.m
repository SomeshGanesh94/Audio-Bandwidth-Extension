%Somesh Ganesh, Audio Bandwidth Extension
%Function to generate band limited audio signal

%Inputs - audio sample, sampling frequency, spectrogram axis for reference
%Output - band limited audio
function [alim] = bLimit(audio,fs,ax)


d = designfilt('lowpassfir', 'PassbandFrequency', (fs/4), ...
                 'StopbandFrequency', (fs/4+500), 'PassbandRipple', 3, ...
                 'StopbandAttenuation', 60, 'SampleRate', fs);

alim = filtfilt(d,audio);

figure;
spectrogram(alim,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Bandlimited signal');

end