clear;clc;

% 定义AR(1)过程的参数
alpha = 0.25; % 自回归系数
sigma_squared = 1; % 白噪声方差

% 定义频率范围
frequencies = linspace(-0.5, 0.5, 100); % 频率范围，通常在[-0.5, 0.5]之间

% 计算功率谱密度函数
S_x1 = sigma_squared ./ abs(1 - alpha * exp(-2i*pi*frequencies)).^2;

beta = 0.25; % β 值，根据您的问题设置

% 计算 H2(f) 的频率响应
H2_frequencies = beta * ones(size(frequencies)); % H2(f) 是常数

% 计算 S_x2(f) = |H2(f)|^2 * S_x1(f)
S_x2 = abs(H2_frequencies).^2 .* S_x1;

% 绘制功率谱密度函数图像
figure
subplot(1,2,1)
plot(frequencies, S_x1);
title('Power Spectral Density of x1(n)');
xlabel('Frequency(f)');
ylabel('Power Spectral Density (S_x1(f))');
grid on;
% 绘制 S_x2(f) 的图像
subplot(1,2,2)
plot(frequencies, S_x2);
title('Power Spectral Density of x2(n)');
xlabel('Frequency(f)');
ylabel('Power Spectral Density (S_x2(f))');
grid on;

