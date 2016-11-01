%Somesh Ganesh, Audio Bandwidth Extension
%BWE Implementation using a half or full wave rectifier for the NLD component

%Inputs - band limited audio, sampling frequency, spectrogram axis for
%reference 
%Output - final reconstructed audio
function afin = rectFunc(alim,fs,ax)

afilt1 = filt1(alim,fs,ax);
%Function to generate the highest octave in the signal

anld = harGen(afilt1,fs,ax);
%Function to generate harmonics using a NLD

afilt2 = filt2(anld',fs,ax);
%Function to filter high frequency content

afin = sigAdd(afilt2,alim,fs,ax);
%Function to add high frequency content to band limited audio

end