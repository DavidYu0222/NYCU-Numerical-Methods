A = [7,-3, 4;
     2, 5, 3;
    -3, 2, 6];
b = [6; -5; 2];

x0 = [0; 0; 0]; % starting vector
tol = 1e-5;     % five significant digits
max_iter = 100;

[x, iter] = JacobiMethod(A, b, x0, tol, max_iter);
fprintf("iteration: %d\n", iter);
disp(x);
