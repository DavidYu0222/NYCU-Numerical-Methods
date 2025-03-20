% Define the function
f = @(x) x .* sin((x - 2) ./ (x - 1));  % function handles

% Plot the formula
X = linspace(0, pi, 2000);
plot(X, f(X));
hold on
grid on

% Define the range near x = 0.95 and Number of intervals to check
x_min = 0.9;
x_max = 1;
num_intervals = 1000;

% Initialize an array to store the intervals
intervals = zeros(num_intervals, 2);    % num_intervals * 2 matrix

% Find intervals where the function changes sign
count = 0;
for i = 1:num_intervals
    x1 = x_min + (x_max - x_min) * (i - 1) / num_intervals;
    x2 = x_min + (x_max - x_min) * i / num_intervals;
    if sign(f(x1)) ~= sign(f(x2))
        count = count + 1;
        intervals(count, :) = [x1, x2];
    end
end

% Discard unused rows
intervals = intervals(1:count, :);

% Use these intervals as starting intervals for bisection method
% Perform bisection on each interval to find the zeros
tol = 1e-8; % Tolerance
max_iter = 100; % Maximum number of iterations

roots = [];
iters = [];
for i = 1:size(intervals, 1)
    [root, iter] = bisection(f, intervals(i, 1), intervals(i, 2), tol, max_iter);
    roots = [roots; root];  % Add new root to roots[]
    iters = [iters; iter];  
end

% Calculate the average of iterations
average_iter = mean(iters);

% Calculate the distances of each root to x = 0.95
distances = abs(roots - 0.95);

% Sort roots based on distances
[~, idx] = sort(distances);

% Display the four zeros nearest to x = 0.95
nearest_roots = roots(idx(1:4));
disp('Four zeros nearest to x = 0.95:');
disp(nearest_roots);
disp('Average of iterations');
disp(average_iter);

% Draw the roots on the plot
scatter(nearest_roots, f(nearest_roots), 'r', 'filled');

% Plot x = 0.95
line([0.95, 0.95], ylim, 'Color', 'k', 'LineStyle', '--');

hold off