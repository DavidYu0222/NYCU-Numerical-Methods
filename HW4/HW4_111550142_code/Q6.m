% Number of random points
N = 1e7;

% R
xmin = -2; xmax = 3;
ymin = -1; ymax = 2;

% Generate random points in R
rng(0);
x = xmin + (xmax - xmin) * rand(N, 1);
y = ymin + (ymax - ymin) * rand(N, 1);

% f(x, y) at the random points
f_values = ((x - 1).^2 + y.^2) / 16;

% The area of R
area_R = (xmax - xmin) * (ymax - ymin);

% A(R)/N * sigma(f(xi, yi))
integral_approx = mean(f_values) * area_R;

fprintf('Use Monte Carlo integration: %.8f\n', integral_approx);

% Define the function
f = @(x, y) ((x - 1).^2 + y.^2) / 16;

% Analytical solution
integral_value = integral2(f, xmin, xmax, ymin, ymax);

fprintf('Analytical solution: %.8f\n', integral_value);