%BWE Implementation using HWR and FWR in two techniques

%Inputs - band limited audio, sampling frequency, spectrogram axis for
%reference
%Output - final reconstructed audio
function afin = bwe(alim,fs,ax)

bwemethod = input('\nEnter the desired method for BWE \n1) HWR \n2) HWR using subband filtering \n3) FWR \n4) FWR using subband filtering \n');

switch(bwemethod)
    case 1
        afilt1 = ufilt(alim,fs,ax);
        anld = hwr(afilt1,fs,ax);
        afilt2 = ufilt2(anld,fs,ax);
        afin2 = sigAdd(afilt2,alim,fs,ax);
        afin = normalizeIntensityLevel(afin2, fs);
        %             audiowrite('HWR.wav',afin,fs);
    case 2
        [afilt11 afilt12] = sfilt(alim,fs,ax);
        anld1 = hwr(afilt11,fs,ax);
        anld2 = hwr(afilt12,fs,ax);
        afilt2 = sfilt2(anld1,anld2,fs,ax);
        afin2 = sigAdd(afilt2,alim,fs,ax);
        afin = normalizeIntensityLevel(afin2, fs);
        %             audiowrite('HWR subband.wav',afin,fs);
    case 3
        afilt1 = ufilt(alim,fs,ax);
        anld = fwr(afilt1,fs,ax);
        afilt2 = ufilt2(anld,fs,ax);
        afin2 = sigAdd(afilt2,alim,fs,ax);
        afin = normalizeIntensityLevel(afin2, fs);
        %             audiowrite('FWR.wav',afin,fs);
    case 4
        [afilt11 afilt12] = sfilt(alim,fs,ax);
        anld1 = fwr(afilt11,fs,ax);
        anld2 = fwr(afilt12,fs,ax);
        afilt2 = sfilt2(anld1,anld2,fs,ax);
        afin2 = sigAdd(afilt2,alim,fs,ax);
        afin = normalizeIntensityLevel(afin2, fs);
        %             audiowrite('FWR subband.wav',afin,fs);
    otherwise
        print('Invalid input');
end
end
