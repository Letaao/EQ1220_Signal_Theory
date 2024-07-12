clear;clc;

N = 100; % 信号长度
z = randn(1, N); % 生成均值为0，方差为1的白噪声信号

% 计算 x(n) 信号
x1 = zeros(1, N);
x2 = zeros(1, N);
px1 = zeros(1, N);
px2 = zeros(1, N);
x1(1) = z(1); % 初始值可以是任意值
Fs = 1; % Sampling frequency (you can change this if needed)
frequencies = linspace(-Fs/2, Fs/2, N); 
% frequencies=(-N/2:N/2-1)/N;
for n = 2:N
    x1(n) = 0.25 * x1(n - 1) + z(n);
%     px1(n)=abs(fftshift(fft(x1(n)))).^2;
end
px1=abs(fftshift(fft(x1))).^2/length(x1);

for n = 1:N
    for k = 0:n-1
        x2(n)=0.25^k.*x1(n-k)+x2(n);     
    end
end
px2=abs(fftshift(fft(x2))).^2/length(x2);

Rx2 = xcorr(x2, 'biased');
M=length(x2);
fr=(-M+1:M-1)/M;

figure(1)
subplot(2,1,1)
plot(frequencies,px1)
title('Power Spectrum of x1(n)');
xlabel('Frequency (Hz)');
ylabel('Power');
grid on;
subplot(2,1,2)
plot(frequencies,px2)
title('Power Spectrum of x2(n)');
xlabel('Frequency (Hz)');
ylabel('Power');
grid on;

figure(2)
plot(fr,Rx2)
grid on;

