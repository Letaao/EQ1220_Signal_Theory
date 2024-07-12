% Define parameters
N = 300; % Length of the sequences
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
Rx2 = xcorr(x2, 'biased');

% Calculate the power spectra by taking the Fourier transforms
Fs = 1; % Sampling frequency (you can change this if needed)
frequencies = linspace(-Fs/2, Fs/2, N); % Frequency axis
M=length(x2);
fr=(-M+1:M-1)/M;

PowerSpectrum_x1 = abs(fftshift(fft(x1))).^2/length(x1); % Power spectrum of x1(n)
PowerSpectrum_x2 = abs(fftshift(fft(x2))).^2/length(x2); % Power spectrum of x2(n)

figure(1)
plot(fr,Rx2)
title('The acf of x2(n)');
xlabel('Frequency (Hz)');
grid on;

% Plot the power spectra
figure(2);
subplot(2, 1, 1);
plot(frequencies, PowerSpectrum_x1);
title('Power Spectrum of x1(n)');
xlabel('Frequency (Hz)');
ylabel('Power');
grid on;

subplot(2, 1, 2);
plot(frequencies, PowerSpectrum_x2(1:1000));
title('Power Spectrum of x2(n)');
xlabel('Frequency (Hz)');
ylabel('Power');
grid on;