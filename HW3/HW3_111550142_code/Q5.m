% [ x0 y0 1;    [a;    [z0;
%   x1 y1 1;  *  b; =   z1;
%   ...          c]     ...
%   xn yn 1]            zn]
% b
xi = [0.40 1.2 3.4 4.1 5.7 7.2 9.3];
yi = [0.70 2.1 4.0 4.9 6.3 8.1 8.9];
zi = [0.031 0.933 3.058 3.349 4.870 5.757 8.921];

% A = [xi, yi, 1...],  B = zi
A = [0.4 0.7 1;
     1.2 2.1 1;
     3.4 4.0 1;
     4.1 4.9 1;
     5.7 6.3 1;
     7.2 8.1 1;
     9.3 8.9 1];

B = [0.031; 0.933; 3.058; 3.349; 4.870; 5.757; 8.921];

% A'Ax = A'B, x = [a b c]
x = (A'*A)\(A'*B);
a = x(1); b = x(2); c = x(3);
disp(['a = ', num2str(a),', b = ', num2str(b),'c = ', num2str(c)]);
% Generate X and Y values for plotting
X = linspace(0, 10, 100);
Y = linspace(0, 10, 100);

[X, Y] = meshgrid(X, Y);

Z = a*X + b*Y + c;

% Plot the surface and the original points
surf(X, Y, Z); hold on;
scatter3(A(:,1), A(:,2), B, 'filled', 'MarkerFaceColor', 'r');
xlabel('x'); ylabel('y'); zlabel('z');
grid on

% c
% SSD = sigma di^2 = sigma axi + byi + c - zi 
SSD = 0;
for i = 1:length(xi)
    SSD = SSD + (a*xi(i) + b*yi(i) + c - zi(i))^2;
end
disp(['Sum of the squares of the deviations: ', num2str(SSD)]);