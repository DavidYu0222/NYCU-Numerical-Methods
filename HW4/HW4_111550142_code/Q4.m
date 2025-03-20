% Calculate the analytical solution of function
g = @(x) sin(x) ./ x;
analytical_ans = integral(g, 0, 1);

a = 0;
b = 1;

h1 = 0.5;
h2 = 0.25;

% Calculate integral using Simpson's 1/3 rule
x1 = a:h1:b;
x2 = a:h2:b;

% 1 4 2 4 2 4 2...2 4 1
ans1= (h1/3) * (f(a) + 4*sum(f(x1(2:2:end-1))) + 2*sum(f(x1(3:2:end-2))) + f(b));
ans2= (h2/3) * (f(a) + 4*sum(f(x2(2:2:end-1))) + 2*sum(f(x2(3:2:end-2))) + f(b));

fprintf('Use h: %.4f, integral: %.8f\n', h1, ans1);
fprintf('Use h: %.4f, integral: %.8f\n', h2, ans2);
fprintf('Analytical solution: %.8f\n', analytical_ans);

% Error term O(n^4)
n = 4;
ex_ans = ans2 + (ans2 - ans1)/(2^n-1);
fprintf('After extrapolation: %.8f\n', ex_ans);

function result = f(x)
    result = x;
    for i = 1:length(x)
        if x(i) == 0
            result(i) = 1;
        else
            result(i) = sin(x(i))/x(i);
        end
    end
end