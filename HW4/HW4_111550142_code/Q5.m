f = @(x, y) exp(x).*sin(2.*y);
xmin = -0.2; xmax = 1.4;
ymin =  0.4; ymax = 2.6;
h = 0.1;

% a
x = xmin:h:xmax;
y = ymin:h:ymax;

Ix = x;
for i = 1:length(x)
    Ix(i) = h/2 * (f(x(i), ymin) + 2*sum(f(x(i), y(2:end-1))) + f(x(i), ymax));
end
ans_a = h/2 * (Ix(1) + 2*sum(Ix(2:end-1)) + Ix(end));
fprintf('Trapezoidal rule: %.8f\n', ans_a);

% b
Ix = x;
for i = 1:length(x)
    Ix(i) = h/3 * (f(x(i), ymin) + 4*sum(f(x(i), y(2:2:end-1))) ...
            + 2*sum(f(x(i), y(3:2:end-2))) + f(x(i), ymax));
end
ans_b = h/3 * (Ix(1) + 4*sum(Ix(2:2:end-1)) + 2*sum(Ix(3:2:end-2))+ Ix(end));
fprintf('Simpson 1/3 rule : %.8f\n', ans_b);

% c
% Change to variable u and t for limits [-1, 1]:
% 0.8t + 0.6, dx = 0.8dt
% 1.1u + 1.5, dy = 1.1du
term = 3;
w = [5/9, 8/9, 5/9];
t = [-0.7745966692414834, 0, 0.7745966692414834];

% term = 5;
% w = [0.2369268850561891, 0.4786286704993665, 0.568888888888888, 0.4786286704993665, 0.2369268850561891];
% t = [-0.9061798459386640, -0.5384693101056831, 0, 0.5384693101056831, 0.9061798459386640];

I = 0;
for j = 1:term
    for i = 1:term
        I = I + w(j) * w(i) * f(0.8*t(j) + 0.6, 1.1*t(i) + 1.5);
    end
end
ans_c = I * 0.8 * 1.1;
fprintf('Gaussian quadrature, 3-term: %.8f\n', ans_c);

integral_value = integral2(f, xmin, xmax, ymin, ymax);
fprintf('Analytical solution: %.8f\n', integral_value);