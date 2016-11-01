function timePlot(audio,alim,afin)

figure;
subplot(311);
plot(audio(20:50));
title('Original signal');
subplot(312);
plot(alim(20:50));
title('Band limited signal');
subplot(313);
plot(afin(20:50));
title('Final reconstructed signal');
end