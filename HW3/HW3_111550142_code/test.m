% Define the evenly spaced points
x_points = linspace(-1, 1, 5);
y_points = arrayfun(@f, x_points);

% Generate the natural cubic spline with end condition 3 (S0 = S1 and Sn = Sn-1)
spline3 = spline(x_points, [0, y_points, 0]);

% Generate the natural cubic spline with end condition 4 (Not-a-Knot)
spline4 = spline(x_points, y_points);

% Generate points to plot the function f(x)
x_vals = linspace(-1, 1, 1000);
y_vals = arrayfun(@f, x_vals);

% Plot the function f(x) and the splines
plot(x_vals, y_vals, 'k-', 'LineWidth', 1.5); hold on;
plot(x_vals, ppval(spline3, x_vals), 'r--', 'LineWidth', 1.5);
plot(x_vals, ppval(spline4, x_vals), 'b--', 'LineWidth', 1.5);
scatter(x_points, y_points, 100, 'filled', 'MarkerFaceColor', 'g');
legend('f(x)', 'Natural Cubic Spline (End Condition 3)', 'Natural Cubic Spline (End Condition 4)', 'Data Points');
xlabel('x');
ylabel('f(x) / Spline');
title('Natural Cubic Spline Interpolation');

% Display which end condition gives the best fit
spline3_error = norm(y_vals - ppval(spline3, x_vals), inf);
spline4_error = norm(y_vals - ppval(spline4, x_vals), inf);
if spline3_error < spline4_error
    disp('End condition 3 (S0 = S1 and Sn = Sn-1) gives the best fit.');
else
    disp('End condition 4 (Not-a-Knot) gives the best fit.');
end


% Define the function f(x) 
function y = f(x)
    if x < -0.5
        y = 0;
    elseif x > 0.5
        y = 0;
    else
        y = 1 - abs(2*x);
    end
end