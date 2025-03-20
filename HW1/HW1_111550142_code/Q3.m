% Define the function
f = @(x) x.^5 - 14*x.^4 + 76*x.^3 - 200*x.^2 + 256 * x - 128; 

% Plot the formula
X = linspace(0, 6, 2000);
plot(X, f(X));
hold on
grid on

x0 = 1;
x1 = 5;
tol = 1e-5;
max_iter = 100;

root1 = bisection(f, x0, x1, tol, max_iter);
root2 = secant(f, x0, x1, tol, max_iter);
root3 = false_position(f, x0, x1, tol, max_iter);

fprintf("bisection method:\n\t%d\n", root1);
fprintf("secant method:\n\t%d\n", root2);
fprintf("false position method:\n\t%d\n", root3);

scatter(root1, f(root1), 'red', 'filled');
scatter(root2, f(root2), 'green', 'filled');
scatter(root3, f(root3), 'blue', 'filled');

hold off