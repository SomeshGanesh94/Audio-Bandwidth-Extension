# Audio-Bandwidth-Extension

This research project aims at studying and finding a suitable method to implement audio bandwidth extension.

The MATLAB implementation folder has a mainProg.m file which accesses all the various function .m files in the folder.

The current module generates harmonics using a half wave or full wave rectifier.

1) bLimit.m band limits the incoming audio
2) rectFunc.m implements functions 3, 4, 5 and 6 to perform Bandwidth extension (BWE)
3) filt1.m extracts the highest octave in the signal
4) harGen.m generates higher harmonics in the signal
5) filt2.m extracts only the required high frequency information
6) sigAdd.m adds the band limited audio and the high frequency content
