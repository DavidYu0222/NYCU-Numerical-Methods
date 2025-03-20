% Define first N term and f function
N = 5;
f = @(x) cos(x);

% Chebyshev series
% Compute the first N Chebyshev polynomials
T = cell(1, N);
T{1} = @(x) 1; % T_0(x)
T{2} = @(x) x; % T_1(x)
T{3} = @(x) 2*x.^2 -1;
T{4} = @(x) 4*x.^3 - 3*x;
T{5} = @(x) 8*x.^4 -8*x.^2 + 1;
% for n = 3:N 
%     T{n} = @(x) 2 * x .* T{n-1}(x) - T{n-2}(x);
% end

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

% Convert it back to power series of x
% const = a{1} - a{3} + a{5};
% x1 = a{2} - 3*a{4};
% x2 = 2*a{3} - 8*a{5};
% x3 = 4*a{4};
% x4 = 8*a{5};

% const = 23039/23040;
% x1 = 0;
% x2 = -639/1280;
% x3 = 0;
% x4 = 19/480;

const = 2303/2304;
x1 = 0;
x2 = -1134/2304;
x3 = 0;
x4 = 48/2304;

disp([num2str(const),' + ', num2str(x1),'x + ', num2str(x2),'x^2 + ', ...
    num2str(x3),'x^3 + ',num2str(x4),'x^4'])
% Plot both Chebyshev and Maclaurin series
X = linspace(-1, 1, 1000);
Y_C = const + x1*X + x2*X.^2 + x3*X.^3 + x4*X.^4;

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
legend('Location', 'best');
hold off;

% Plot error of both series
figure
error_C = Y_C - f(X);
error_M = Y_M - f(X);
plot(X, error_C, 'r', 'DisplayName', 'Error of Chebyshev series'); hold on;
plot(X, error_M, 'b', 'DisplayName', 'Error of Maclaurin series');
grid on; 
legend('Location', 'best');
hold off