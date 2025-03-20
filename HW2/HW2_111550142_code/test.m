clear;
A = [1,-2, 4; 8, -3, 2; -1, 10, 2];
b = [6; 2; 4];
x = GE_Pivoting(A, b, true);
disp(x);

%x = A\b;
%disp(x);