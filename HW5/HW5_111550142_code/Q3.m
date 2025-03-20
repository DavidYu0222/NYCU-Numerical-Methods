% a
% Define the system of differential equations
f = @(t, y) [y(2); y(3); 2*y(1) - t*y(2) + t];

% Initial conditions
y0 = [0; 1; 0];

% Solve the system using ode45
[~, y] = ode45(f, [0, 0.2], y0);
y02 = y(end, :)';
[~, y] = ode45(f, [0, 0.4], y0);
y04 = y(end, :)';
[~, y] = ode45(f, [0, 0.6], y0);
y06 = y(end, :)';

% Display the results
fprintf('y(0.2) = %.5f\n', y02(1));
fprintf('y(0.4) = %.5f\n', y04(1));
fprintf('y(0.6) = %.5f\n', y06(1));

% b
% Step size
h = 0.2;

yn = y06;
yn_1 = y04;
yn_2 = y02;
yn_3 = y0;

% Solve the system using the Adams-Moulton method
for i = 0.6:h:0.8
    % Predictor
    y_next = yn + h/24 * (55*f(i, yn) - 59*f(i-h, yn_1) + 37*f(i-2*h, yn_2) - 9*f(i-3*h,yn_3));
    % Corrector
    y_next = yn + h/24 * (9*f(i+h, y_next) + 19*f(i, yn) - 5*f(i-h, yn_1) + 1*f(i-2*h,yn_2));
    
    yn_3 = yn_2;
    yn_2 = yn_1;
    yn_1 = yn;
    yn = y_next;
end

fprintf('y(1.0) = %.5f\n', yn(1));
