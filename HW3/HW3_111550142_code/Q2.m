% Define the five evenly spaced points and their function values
x = linspace(-1, 1, 5);
y = arrayfun(@f, x);

% Calculate the step sizes h = xi+1 - x
h = diff(x);    

% Calculate the divided differences f[xi, xi+1] = (yi+1 - yi) / hi;
div_diff = diff(y) ./ h;

% Solve the system HS = Y
% End condition 3: S0 = S1, Sn-1 = Sn, End condition 4: Not a knot
n = length(x);
H_3 = zeros(n, n);
H_3(1,1) = 1;
H_3(n,n) = 1;

H_4 = zeros(n, n);
H_4(1,1) = 1;
H_4(n,n) = 1;
for i = 2:n-1
    H_3(i,i-1) = h(i-1);
    H_3(i,i) = 2 * (h(i-1) + h(i));
    H_3(i,i+1) = h(i);

    H_4(i,i-1) = h(i-1);
    H_4(i,i) = 2 * (h(i-1) + h(i));
    H_4(i,i+1) = h(i);
end
H_3(2,2) = 3*h(1) + 2*h(2);
H_3(n-1, n-1) = 2*h(end-1) + 3*h(end);

H_4(2,2:3) = [(h(1)+h(2))*(h(1)+2*h(2))/h(1), (h(2)^2-h(1)^2)/h(2)];
H_4(n-1, n-2:n-1) = [(h(end-1)^2-h(end)^2)/h(end-1),...
    (h(end-1)+h(end))*(h(end)+2*h(end-1))/h(end-1)];

Y = 6 * diff(div_diff)';
Y = [0; Y; 0];

S_3 = (H_3 \ Y)';
S_3(1) = S_3(2);
S_3(end) = S_3(end-1);

S_4 = (H_4 \ Y)';
S_4(1) = ((h(1)+h(2))*S_4(2) - h(1)*S_4(3))/h(2);
S_4(end) = ((h(end-1)+h(end))*S_4(end-1) - h(end)*S_4(end-2))/h(end-1);

% Calculate the coefficients of the cubic polynomials
% a = (Si+1 - Si) / 6hi
% b = Si/2
% c = (yi+1 - yi) / hi - (2hiSi + hiSi+1)/6 
% d = yi;
a_3 = diff(S_3) ./ (6*h);
b_3 = S_3(1:n-1) / 2;
c_3 = div_diff - (2*S_3(1:n-1) + S_3(2:n)).*h/6;
d_3 = y(1:n-1);

a_4 = diff(S_4) ./ (6*h);
b_4 = S_4(1:n-1) / 2;
c_4 = div_diff - (2*S_4(1:n-1) + S_4(2:n)).*h/6;
d_4 = y(1:n-1);

% Plot graph
X = linspace(-1, 1, 400);
y = arrayfun(@f, X);
plot(X, y, 'k', 'LineWidth', 1.5); hold on;
for i = 1:n-1
    X = linspace(x(i), x(i+1), 100);
    p_3 = @(X) a_3(i)*(X - x(i)).^3 + b_3(i)*(X - x(i)).^2 + c_3(i)*(X - x(i)) + d_3(i);
    p_4 = @(X) a_4(i)*(X - x(i)).^3 + b_4(i)*(X - x(i)).^2 + c_4(i)*(X - x(i)) + d_4(i);

    plot(X, p_3(X),'r', 'LineWidth', 1.5);
    plot(X, p_4(X),'b', 'LineWidth', 1.5);
end
legend('f(x)', 'Natural Cubic Spline (End Condition 3)', ...
    'Natural Cubic Spline (End Condition 4)');
hold off;
grid on;

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