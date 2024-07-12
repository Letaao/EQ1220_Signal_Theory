clear;clc;
load('spydata1.mat')
load('training1.mat')
mu=0.01;
L = 4; % 滤波器阶数
w = zeros(1, L+1); % 初始化滤波器系数
desired_signal = training; % 已知的训练序列
received_signal=received;
mse_history = []; % 用于存储分析用的MSE值

for k = L+1:32
    % 提取接收信号的窗口
    x = received_signal(k:-1:k-L);
    % 计算滤波器输出
    y = w .* x';
    
    % 使用LMS算法更新滤波器系数
    error = desired_signal(k) - y;
    w = w + mu * error * x;
    
    % 计算MSE并存储供分析使用
   % mse = mean((desired_signal(1:k) - w .* received_signal(k:-1:k-L)').^2);
   % mse_history = [mse_history, mse];
    mse = mean((desired_signal(1:32) - y).^2);
end