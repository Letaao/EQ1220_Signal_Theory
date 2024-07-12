% Define parameters
N = 1000; % Length of the sequences
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

% Calculate the autocorrelation functions Rx1(k) and Rx2(k)
Rx1 = xcorr(x1, 'biased'); % Autocorrelation of x1(n)
Rx2 = xcorr(x2, 'biased'); % Autocorrelation of x2(n)

% Calculate the power spectra Rx1(v) and Rx2(v) by taking the Fourier transforms
Fs = 1; % Sampling frequency (you can change this if needed)
frequencies = linspace(-Fs/2, Fs/2, N); % Frequency axis

Rx1_v = fftshift(fft(Rx1, N)); % Power spectrum of x1(n)
Rx2_v = fftshift(fft(Rx2, N)); % Power spectrum of x2(n)

% Plot the power spectra
figure;
subplot(2, 1, 1);
plot(frequencies, abs(Rx1_v));
title('Power Spectrum of x1(n)');
xlabel('Frequency (Hz)');
ylabel('Power');

subplot(2, 1, 2);
plot(frequencies, abs(Rx2_v));
title('Power Spectrum of x2(n)');
xlabel('Frequency (Hz)');
ylabel('Power');

% Add grid lines
grid on;
