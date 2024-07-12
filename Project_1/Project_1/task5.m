clear;clc;
load('SinusInNoise2.mat');

figure(1)
[yt,xt]=periodogram(y);
x3=xt./(2*pi);
plot(x3,yt);
grid on;
xlabel('Normalized Frequency');
%ylabel('Power');
title('Periodogram Power Spectral Density Estimation (y)');