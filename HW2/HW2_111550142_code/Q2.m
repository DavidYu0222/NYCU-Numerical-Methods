A = [0.1, 51.7; 5.1, -7.3];
b = [104; 16];

fprintf("Gaussian Elimination without Partial Pivoting\n")
x = GE_Pivoting(A, b, false, 3);
disp(x);

fprintf("Gaussian Elimination with Partial Pivoting\n")
x = GE_Pivoting(A, b, true, 3);
disp(x);

fprintf("Gaussian Elimination with Scale Partial Pivoting\n")
x = GE_ScaledPivoting(A, b, 3);
disp(x);
