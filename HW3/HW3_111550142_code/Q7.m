% Define the original function
f = @(x) x.^2 - 1;

% Define the period
T = 3;

% Calculate a0
a0 = (1/T)*integral(f, -1, 2);

% Number of terms in the Fourier series
N = 10;

% Generate X values for plotting
X0 = linspace(-1, 2, 90);
X = linspace(-10, 10, 600);

% Initialize Fourier series function
F = zeros(size(X));
F = F + a0/2;
% Compute the Fourier series approximation
a_n = zeros(1, N);
b_n = zeros(1, N);
for n = 1:N
    a_n(n) = (2/T)*integral(@(x) f(x).*cos(2*pi*n*x/T), -1, 2);
    b_n(n) = (2/T)*integral(@(x) f(x).*sin(2*pi*n*x/T), -1, 2);
    F = F + a_n(n) * cos(2*pi*n*X/T) + b_n(n) * sin(2*pi*n*X/T);
end
disp('An: (A1 to A10)')
disp(a_n);
disp('Bn: (B1 to B10)')
disp(b_n);
disp('A0:')
disp(a0);

% Compute Y for the original function
Y0 = f(X0);

% Plot the original function and its Fourier series approximation
plot(X, F, 'r', 'LineWidth', 2); % Fourier series approximation
hold on;
plot(X0, Y0, 'b', 'LineWidth', 2); % Original function
hold off;
xlabel('x');
ylabel('y');
title('Fourier Series Approximation of f(x)');
legend('Original Function', 'Fourier Series Approximation');
grid on;
