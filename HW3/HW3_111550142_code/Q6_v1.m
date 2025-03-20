% Define first N term and f function
N = 5;
f = @(x) cos(x);

% Chebyshev series
% Compute the first N Chebyshev polynomials
T = cell(1, N);
T{1} = @(x) 1; % T_0(x)
T{2} = @(x) x; % T_1(x)
for n = 3:N 
    T{n} = @(x) 2 * x .* T{n-1}(x) - T{n-2}(x);
end

% Compute the coefficient a
integrand = cell(1, N);
for n = 1:N 
    integrand{n} = @(t) f(t) .* T{n}(t) ./ sqrt(1 - t.^2);
end

a = cell(1, N);
for n = 1:N
    if n == 1
        a{n} = 1/pi * integral(@(t) integrand{n}(t), -1, 1);
    else
        a{n} = 2/pi * integral(@(t) integrand{n}(t), -1, 1);
    end
end

% Plot both Chebyshev and Maclaurin series
X = linspace(-1, 1, 1000);
Y_C = zeros(size(X));
for i = 1:length(X)
    sigma = 0;
    for k = 1:N
        sigma = sigma + a{k} * T{k}(X(i));
    end
    Y_C(i) = sigma;
end

% Maclaurin series
Y_M = zeros(size(X));
for i = 1:length(X)
    sigma = 0;
    for n = 0:N/2
        sigma = sigma + (-1)^n * X(i).^(2*n) / factorial(2*n);
    end
    Y_M(i) = sigma;
end

plot(X,Y_C,'r', 'DisplayName', 'Chebyshev series'); hold on;
plot(X, f(X),'k', 'DisplayName', 'Real function');
plot(X,Y_M,'b', 'DisplayName', 'Maclaurin series');
grid on;
hold off;
% Plot error of both series
figure
error_C = Y_C - f(X);
error_M = Y_M - f(X);
plot(X, error_C, 'r', 'DisplayName', 'Chebyshev series'); hold on;
plot(X, error_M, 'b', 'DisplayName', 'Maclaurin series');