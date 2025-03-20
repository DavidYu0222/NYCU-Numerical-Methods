A = [2, -2; -2, 2];
b = [0; 0];

tol = 1e-5;
max_iter = 100;

% (a)
fprintf("Question a:\n");
x0 = [1; 1];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, ~] = JacobiMethod(A, b, x0, tol, max_iter);
disp(x);

x0 = [1; -1];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, ~] = JacobiMethod(A, b, x0, tol, max_iter);
disp(x);

x0 = [-1; 1];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, ~] = JacobiMethod(A, b, x0, tol, max_iter);
disp(x);

x0 = [2; 5];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, ~] = JacobiMethod(A, b, x0, tol, max_iter);
disp(x);

x0 = [5; 2];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, ~] = JacobiMethod(A, b, x0, tol, max_iter);
disp(x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (b)
fprintf("Question b:\n");
x0 = [1; 1];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, ~] = GaussSeidelMethod(A, b, x0, tol, max_iter);
disp(x);

x0 = [1; -1];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, ~] = GaussSeidelMethod(A, b, x0, tol, max_iter);
disp(x);

x0 = [-1; 1];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, ~] = GaussSeidelMethod(A, b, x0, tol, max_iter);
disp(x);

x0 = [2; 5];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, ~] = GaussSeidelMethod(A, b, x0, tol, max_iter);
disp(x);

x0 = [5; 2];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, ~] = GaussSeidelMethod(A, b, x0, tol, max_iter);
disp(x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c)
A = [2, -1.99; -1.99, 2];
b = [0; 0];

tol = 1e-5;
max_iter = 3000;

fprintf("Question c:\n");
x0 = [1; 1];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, iter] = JacobiMethod(A, b, x0, tol, max_iter);
fprintf("Iteration: %d\n", iter);
disp(x);

x0 = [1; -1];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, iter] = JacobiMethod(A, b, x0, tol, max_iter);
fprintf("Iteration: %d\n", iter);
disp(x);


x0 = [-1; 1];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, iter] = JacobiMethod(A, b, x0, tol, max_iter);
fprintf("Iteration: %d\n", iter);
disp(x);


x0 = [2; 5];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, iter] = JacobiMethod(A, b, x0, tol, max_iter);
fprintf("Iteration: %d\n", iter);
disp(x);

x0 = [5; 2];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, iter] = JacobiMethod(A, b, x0, tol, max_iter);
fprintf("Iteration: %d\n", iter);
disp(x);

x0 = [1; 1];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, iter] = GaussSeidelMethod(A, b, x0, tol, max_iter);
fprintf("Iteration: %d\n", iter);
disp(x);

x0 = [1; -1];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, iter] = GaussSeidelMethod(A, b, x0, tol, max_iter);
fprintf("Iteration: %d\n", iter);
disp(x);

x0 = [-1; 1];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, iter] = GaussSeidelMethod(A, b, x0, tol, max_iter);
fprintf("Iteration: %d\n", iter);
disp(x);

x0 = [2; 5];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, iter] = GaussSeidelMethod(A, b, x0, tol, max_iter);
fprintf("Iteration: %d\n", iter);
disp(x);

x0 = [5; 2];
fprintf("Use [%d, %d] as the starting vector:\n", x0(1), x0(2));
[x, iter] = GaussSeidelMethod(A, b, x0, tol, max_iter);
fprintf("Iteration: %d\n", iter);
disp(x);
