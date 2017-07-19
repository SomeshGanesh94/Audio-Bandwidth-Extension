%Filter 1 section
%Inputs - band limited audio, sampling frequency, spectrogram axis for reference
%Output - Signals after the first bandpass filter

function [afilt11 afilt12] = sfilt(alim,fs,ax)

filt1 = designfilt('bandpassiir', 'StopbandFrequency1', (fs/12-500), ...
                'PassbandFrequency1', (fs/12), 'PassbandFrequency2', (0.75*fs/6), ...
                'StopbandFrequency2', (0.75*fs/6+500), 'StopbandAttenuation1', 60, ...
                'PassbandRipple', 3, 'StopbandAttenuation2', 60, ...
                'SampleRate', fs);
            
filt2 = designfilt('bandpassiir', 'StopbandFrequency1', (0.75*fs/6-500), ...
                'PassbandFrequency1', (0.75*fs/6), 'PassbandFrequency2', (fs/6), ...
                'StopbandFrequency2', (fs/6+500), 'StopbandAttenuation1', 60, ...
                'PassbandRipple', 3, 'StopbandAttenuation2', 60, ...
                'SampleRate', fs);
            
afilt11 = filtfilt(filt1,alim);
afilt12 = filtfilt(filt2,alim);

figure;
spectrogram(afilt11,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Signal after Filter 1a');
figure;
spectrogram(afilt12,hamming(1024),512,1024,fs,'yaxis');
caxis(ax);
title('Signal after Filter 1b');

end