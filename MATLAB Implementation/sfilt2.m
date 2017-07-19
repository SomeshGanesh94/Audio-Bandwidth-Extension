%Function to filter only high frequency content
%Inputs - signal after NLD, sampling frequency, spectrogram axis for reference
%Output - signals with only high frequency content

function afilt2 = sfilt2(anld1,anld2,fs,ax);

filt1 = designfilt('bandpassiir', 'StopbandFrequency1', (fs/6-500), ...
                'PassbandFrequency1', (fs/6), 'PassbandFrequency2', (0.75*fs/3-500), ...
                'StopbandFrequency2', (0.75*fs/3), 'StopbandAttenuation1', 60, ...
                'PassbandRipple', 3, 'StopbandAttenuation2', 60, ...
                'SampleRate', fs);

filt2 = designfilt('bandpassiir', 'StopbandFrequency1', (0.75*fs/3-500), ...
                'PassbandFrequency1', (0.75*fs/3), 'PassbandFrequency2', (fs/3-500), ...
                'StopbandFrequency2', (fs/3), 'StopbandAttenuation1', 60, ...
                'PassbandRipple', 3, 'StopbandAttenuation2', 60, ...
                'SampleRate', fs);
                      
afilt21 = filtfilt(filt1,anld1);
afilt22 = filtfilt(filt2,anld2);

afilt2 = afilt21 + afilt22;

figure;
spectrogram(afilt21,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Signal after Filter 2a');
figure;
spectrogram(afilt22,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Signal after Filter 2b');
figure;
spectrogram(afilt2,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Signal after Filter 2');

end