M = [-1, 3,-3, 1;
      3,-6, 3, 0;
     -3, 0, 3, 0;
      1, 4, 1, 0];

X = [1.3, 1.3, 1.3, 1.3;
     1.3, 2.5, 2.5, 2.5;
     2.5, 2.5, 3.1, 3.1;
     3.1, 3.1, 3.1, 4.7];

Y = [0.2, 0.4 ,0.5, 0.7;
     0.9, 0.2, 0.4 ,0.5;
     0.7, 0.9, 0.2, 0.4;
     0.5, 0.7, 0.9, 0.5];

Z = [2.521 2.792 2.949 3.314;
    3.760 3.721 3.992 4.149;
    4.514 4.960 4.321 4.592;
    4.749 5.114 5.560 6.349];

Cx = 1/36 * M * X * (M');
vec_u = Cx(:,4)';
vec_u(4) = vec_u(4) - 2.8;
u_roots = roots(vec_u);
u = u_roots(imag(u_roots) == 0);

u_v = [u^3, u^2, u, 1];

Cy = 1/36 * M * Y * (M');
vec_v = Cy(4,:);
vec_v(4) = vec_v(4) - 0.54;
v_roots = roots(vec_v);
v = v_roots(imag(v_roots) == 0);

v_v = [v^3; v^2; v; 1];

test_x = 1/36 * u_v * M * X * (M') * v_v; 
test_y = 1/36 * u_v * M * Y * (M') * v_v; 

% z(u, v) = 1/36 * u'MZM'v
z = 1/36 * u_v * M * Z * (M') * v_v; 
disp(['z = ', num2str(z)]);

% Generate X and Y values for plotting
[X0, Y0] = meshgrid(linspace(1.3, 4.7, 100), linspace(0.2, 0.9, 100));

Z0 = X0 + exp(Y0);

% Plot the surface and the original points
surf(X0, Y0, Z0); hold on;

% Define XYZ grid
Fx = @(u, v)1/36 * [u^3, u^2, u, 1]* M * X * (M') * [v^3; v^2; v; 1]; 
Fy = @(u, v)1/36 * [u^3, u^2, u, 1]* M * Y * (M') * [v^3; v^2; v; 1]; 
Fz = @(u, v)1/36 * [u^3, u^2, u, 1]* M * Z * (M') * [v^3; v^2; v; 1]; 
[u, v] = meshgrid(linspace(0, 1, 100), linspace(0, 1, 100));

% Evaluate the function at each point on the grid
X1 = zeros(size(u));
Y1 = zeros(size(u));
Z1 = zeros(size(u));
for i = 1:size(Z1, 1)
    for j = 1:size(Z1, 1)
        X1(i, j) = Fx(u(1, i), v(j, 1));
        Y1(i, j) = Fy(u(1, i), v(j, 1));
        Z1(i, j) = Fz(u(1, i), v(j, 1));
    end
end

% Plot the surface
surf(X1, Y1, Z1);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Surface Plot of the Function');

scatter3(X, Y, Z, 'filled', 'MarkerFaceColor', 'r');
grid on