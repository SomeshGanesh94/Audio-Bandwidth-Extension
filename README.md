# Audio-Bandwidth-Extension

This research project aims at studying and finding a suitable method to implement audio bandwidth extension.

The MATLAB implementation folder has a mainprog.m file which accesses all the various function .m files in the folder.

1) blimit.m band limits the incoming audio
2) filt1.m extracts the highest octave in the signal
3) hargen.m generates higher harmonics in the signal
4) filt2.m extracts only the required high frequency information
5) sigadd.m adds the band limited audio and the high frequency content
