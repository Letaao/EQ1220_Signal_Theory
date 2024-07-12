clear;clc;
load('SinusInNoise1.mat');

N=length(y1);
frequencies=(-N/2:N/2-1)/N;

p1=abs(fft(y1)).^2/length(y1); %计算频谱

sigma_w=1; 
white_noise = sigma_w*randn(size(y1));
h2=white_noise+sin(2*pi*0.05*frequencies)+sin(2*pi*0.25*frequencies);

p_white_noise = power(abs(fft(white_noise)),2) / length(white_noise);
p_h2=abs(fft(h2)).^2/length(h2);

figure(1)
%subplot(2,1,1)
[yt,xt]=periodogram(y1);
x3=xt./(2*pi);
plot(x3,yt);
grid on;
xlabel('Normalized Frequency');
%ylabel('Power');
title('Periodogram Power Spectral Density Estimation (y1)');
%subplot(2,1,2)
[yd,xd]=periodogram(y2);
x4=xd./(2*pi);
plot(x4,yd);
grid on;
xlabel('Normalized Frequency');
%ylabel('Power');
title('Periodogram Power Spectral Density Estimation (y2)');


figure(2)
% plot(frequencies, p1);
% xlabel('频率');
% ylabel('功率谱');
% title('离散序列的周期图');
grid on;
hold on
plot(frequencies, p_white_noise);
grid on;
