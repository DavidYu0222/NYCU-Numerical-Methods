% Define the function
f = @(x) 4*x.^3 - 3*x.^2 + 2*x - 1;

% Initial guesses near x = 0.6
x0 = 0.1;
x1 = 0.6;
x2 = 1.1;

% Tolerance
tol = 1e-8;

% Maximum number of iterations
max_iter = 100;

% Call Muller's method
root = muller(f, x0, x1, x2, tol, max_iter);

% Display the root
fprintf('Root near 0.6 of the function in a: %d\n', root);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define the function
f = @(x) x.^2 + exp(x) - 5;

% Initial guesses near x = 1
x0 = 0.5;
x1 = 1;
x2 = 1.5;

% Tolerance
tol = 1e-8;

% Maximum number of iterations
max_iter = 100;

% Call Muller's method
root = muller(f, x0, x1, x2, tol, max_iter);

% Display the root
fprintf('Root near   1 of the function in b: %d\n', root);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

% Define the function
f = @(x) x.^2 + exp(x) - 5;

% Initial guesses near x = -2
x0 = -3;
x1 = -2;
x2 = -1;

% Tolerance
tol = 1e-8;

% Maximum number of iterations
max_iter = 100;

% Call Muller's method
root = muller(f, x0, x1, x2, tol, max_iter);

% Display the root
fprintf('Root near  -2 of the function in b: %d\n', root);
