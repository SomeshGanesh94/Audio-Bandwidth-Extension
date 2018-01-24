# Audio-Bandwidth-Extension, GTCMT Fall 2016

This research project aims at studying and finding a suitable method to implement audio bandwidth extension to bandlimited audio files.

The MATLAB implementation folder has a mainProgam.m file which accesses all the various functions in the folder.

The module generates harmonics using a half wave or full wave rectifier with two techniques.
The detailed algorithm, experiments, results and discussion can be found in the [7100_Fall_2016_paper.pdf](https://github.com/SomeshGanesh94/Audio-Bandwidth-Extension/blob/master/7100%20Fall%202016%20paper.pdf) file.

1) bLimit.m band limits audio to generate the dataset (bandlimited audio file)
2) bwe.m is a wrapper for the different functions performed for bandwidth extension
3) fwr.m performs full wave rectification
4) hwr.m performs half wave rectification
5) normalizeIntensityLevel normalizes the audio files to a given rms value
6) sfilt.m performs the first filter action in the subband filtering technique
7) sfilt2.m performs the second filter action to extract high frequency content in the subband filtering technique
8) sigAdd.m adds the band limited audio and the high frequency content
9) ufilt.m performs the first filter action to extract the highest octave present in the badnlimited audio
10) ufilt2.m performs the second filter action to extract high frequency content
