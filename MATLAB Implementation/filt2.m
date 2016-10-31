%Somesh Ganesh, Audio Bandwidth Extension
%Function to filter only high frequency content

%Inputs - signal after NLD, sampling frequency, spectrogram axis for
%reference
%Output - signal with only high frequency content
function afilt2 = filt2(audio,fs,ax)

d = designfilt('bandpassiir', 'StopbandFrequency1', (fs/4-500), ...
                'PassbandFrequency1', (fs/4), 'PassbandFrequency2', (fs/2-500), ...
                'StopbandFrequency2', (fs/2), 'StopbandAttenuation1', 60, ...
                'PassbandRipple', 3, 'StopbandAttenuation2', 60, ...
                'SampleRate', fs);
            
afilt2 = filtfilt(d,audio);

figure;
spectrogram(afilt2,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Signal after Filter 2');

end