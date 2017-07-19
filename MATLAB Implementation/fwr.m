%Function for full wave rectification
%Inputs - Input audio, sampling frequency, spectrogram axis for reference
%Outputs - Full wave rectified audio

function anld = fwr(audio,fs,ax)

anld = audio.*sign(audio);

figure;
spectrogram(anld,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Signal after NLD');

end