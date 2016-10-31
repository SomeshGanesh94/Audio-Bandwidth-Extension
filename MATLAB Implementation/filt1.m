%Somesh Ganesh, Audio Bandwidth Extension
%Filter 1 section

%Inputs - band limited audio, sampling frequency, spectrogram axis for
%reference
%Output - Signal after the first bandpass filter
function afilt1 = filt1(audio,fs,ax)

filt1 = designfilt('bandpassiir', 'StopbandFrequency1', (fs/8), ...
                'PassbandFrequency1', (fs/8+500), 'PassbandFrequency2', (fs/4), ...
                'StopbandFrequency2', (fs/4+500), 'StopbandAttenuation1', 80, ...
                'PassbandRipple', 3, 'StopbandAttenuation2', 80, ...
                'SampleRate', fs);
            
afilt1 = filtfilt(filt1,audio);

figure;
spectrogram(afilt1,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Signal after Filter 1');

end