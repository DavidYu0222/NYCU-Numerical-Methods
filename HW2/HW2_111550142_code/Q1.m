clear;
A = [3, 1, -4; -2, 3, 1; 2, 0, 5];
b = [7; -5; 10];
x = GE_Pivoting(A, b, true);
disp(x);

%x = A\b;
%disp(x);