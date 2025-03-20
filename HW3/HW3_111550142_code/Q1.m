% a
x = [-0.2, 0.3, 0.7, -0.3, 0.1];
f_x = [1.23, 2.34, -1.05, 6.51, -0.06];

table_a = DividedDifference(x,f_x);

disp('Divided-difference table:')
disp(table_a);

% b
% Choose the first 3 points to interpolate
x = [-0.2, 0.3, 0.7];
f_x = [1.23, 2.34, -1.05];

table_b = DividedDifference(x,f_x);

x0 = 0.4;

result = table_b(1, length(x)+1);

for i = (length(x)):-1:2
    result = result*(x0 - x(i-1)) + table_b(1, i);
end
disp('Divided-difference table:')
disp(table_b);
disp(['The interpolated value at x = 0.4 is: ', num2str(result)]);

% c
% Choose the 3 points that are closest to the point x = 0.4
x = [0.3, 0.7, 0.1];
f_x = [2.34, -1.05, -0.06];

table_c = DividedDifference(x,f_x);

x0 = 0.4;

result = table_c(1, length(x)+1);

for i = (length(x)):-1:2
    result = result*(x0 - x(i-1)) + table_c(1, i);
end
disp('Divided-difference table:')
disp(table_c);
disp(['The interpolated value at x = 0.4 is: ', num2str(result)]);
