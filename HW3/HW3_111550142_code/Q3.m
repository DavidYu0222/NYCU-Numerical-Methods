% a
x = [0, 1, 2, 3];
y = [0, 0.3, 1.7, 1.5];

% Plot the zigzag line
plot(x, y, 'k--', 'LineWidth', 1.5); hold on;
scatter(x, y, 'filled', 'MarkerFaceColor', 'b');

% x(u) = u'MPx
% y(u) = u'MPy
M = [2,-2, 1, 1;
    -3, 3,-2,-1;
     0, 0, 1, 0;
     1, 0, 0, 0];

P = [1, 0, 0, 0;
     0, 0, 0, 1;
    -3, 3, 0, 0;
     0, 0,-3, 3];

x_u = M*P*(x');
y_u = M*P*(y');

u = linspace(0, 1, 100);
x_p = x_u(1)*u.^3 + x_u(2)*u.^2 + x_u(3)*u + x_u(4);
y_p = y_u(1)*u.^3 + y_u(2)*u.^2 + y_u(3)*u + y_u(4);

% Plot the function P(u) = (x(u), y(u))
plot(x_p, y_p, 'b', 'LineWidth', 1.5);

% b
% Solve a and b
u_a = [(1/3)^3, (1/3)^2, (1/3), 1];
u_b = [(2/3)^3, (2/3)^2, (2/3), 1];
vec_a = u_a*M*P;
vec_b = u_b*M*P;
A = [vec_a(2:3); vec_b(2:3)];
B = [0.3; 1.7] - 1.5*[37/999; 296/999];
result = A \ B;
a = result(1);
b = result(2);
disp(['a = ', num2str(a),', b = ', num2str(b)]);

% Calculate the new curve
x = [0, 1, 2, 3];
y = [0, a, b, 1.5];

scatter(x, y, 'filled', 'MarkerFaceColor', 'r');

x_u = M*P*(x');
y_u = M*P*(y');

u = linspace(0, 1, 100);

x_p = x_u(1)*u.^3 + x_u(2)*u.^2 + x_u(3)*u + x_u(4);
y_p = y_u(1)*u.^3 + y_u(2)*u.^2 + y_u(3)*u + y_u(4);

% Plot the function P(u) = (x(u), y(u))
plot(x_p, y_p, 'r', 'LineWidth', 1.5);
hold off;
