%Somesh Ganesh, Audio Bandwidth Extension
%Function to add high frequency content to band limited audio

%Inputs - signal with only high frequency content, band limited audio,
%sampling frequency, spectrogram axis for reference
%Output - final bandwidth extended audio
function afin = sigAdd(afilt2,alim,fs,ax)

afin = alim + afilt2;

figure;
spectrogram(afin,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Final signal');

end