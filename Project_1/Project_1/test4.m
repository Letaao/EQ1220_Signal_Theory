% 假设您已经有 x2(n) 的序列
% Define parameters
N = 100; % Length of the sequences
sigma_z2 = 1;
alpha = 0.25;
beta = 0.25;

% Generate white noise sequence z(n)
z = sqrt(sigma_z2) * randn(N, 1);

% Generate AR(1) process x1(n)
x1 = zeros(N, 1);
for n = 2:N
    x1(n) = alpha * x1(n - 1) + z(n);
end
% Generate impulse response h2(n)
n_h2 = 0:10; % Adjust the length as needed
h2 = beta.^n_h2;

% Convolve x1(n) with h2(n) using convolution to get x2(n)
x2 = conv(x1, h2, 'full');
% 定义滞后范围
k_max = 10; % 想要计算的自相关函数的最大滞后

% 初始化 R_x2(k)
R_x2 = zeros(1, k_max+1);

% 计算 R_x2(k)
N = length(x2); % 序列的长度
for k = 0:k_max
    sum = 0;
    for n = 1:(N - k)
        sum = sum + x2(n) * x2(n + k);
    end
    R_x2(k+1) = sum / (N - k); % 规范化自相关函数
end

% 创建滞后范围的数组
k_values = 0:k_max;

% 绘制自相关函数图形
plot(k_values, R_x2);
title('x2(n) 的自相关函数');
xlabel('滞后 (k)');
ylabel('自相关值');
grid on;
