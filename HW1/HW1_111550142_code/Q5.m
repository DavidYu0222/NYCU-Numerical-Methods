%f = @(x) exp(x) - 2*x^2;
g_positive = @(x) sqrt(exp(x)/2);
g_negative = @(x) -sqrt(exp(x)/2);

% Set initial guess
x0 = 2.7; % can change

% Tolerance
tol = 1e-8;

% Maximum number of iterations
max_iter = 100;

% Perform fixed-point iteration for positive root
root_positive = fixed_point(g_positive, x0, tol, max_iter);
fprintf('Approximate root x0 = %.01d postitive value used: %d\n', x0, root_positive);

% Perform fixed-point iteration for negative root
root_negative = fixed_point(g_negative, x0, tol, max_iter);
fprintf('Approximate root x0 = %.01d negative value used:: %d\n', x0, root_negative);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%f = @(x) exp(x) - 2*x^2;
h = @(x) log(2*x.^2);

% Set initial guess
x0 = 2.7; % can change

% Tolerance
tol = 1e-8;

% Maximum number of iterations
max_iter = 100;

% Perform fixed-point iteration for positive root
root = fixed_point(h, x0, tol, max_iter);
fprintf('Approximate root x0 = %.01d h(x) used: %d\n', x0, root);

