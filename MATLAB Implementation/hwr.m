%Function to perform half wave rectification
%Inputs - Input audio, sampling frequency, spectrogram axis for reference
%Outputs - Half wave rectified audio

function anld = hwr(audio,fs,ax)

%Half wave rectifier
anld = audio.*((sign(audio)+1)/2);

figure;
spectrogram(anld,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Signal after Half wave rectification');

end