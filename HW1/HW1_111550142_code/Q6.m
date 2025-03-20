% Define system of equations
equations = @(x) [cos(x(1))^2 - x(2); x(1)^2 + x(2)^2 - x(1) - 2];

% Define Jacobian matrix
jacobian = @(x) [-2*cos(x(1))*sin(x(1)), -1; 2*x(1) - 1, 2*x(2)];

% Define initial guess
x0 = [0.5; 0.5]; % can change

% Tolerance and maximum number of iterations
tol = 1e-8;
max_iter = 100;

% Perform Newton's method
[root, iter] = newton(equations, jacobian, x0, tol, max_iter);

% Display result
fprintf('Root of the system: [x, y] = [%d, %d]\n', root(1), root(2));
fprintf('Number of iterations: %d\n', iter);