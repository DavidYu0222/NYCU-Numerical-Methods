function [x2, iter] = secant(f, x0, x1, tol, max_iter)

if abs(f(x0)) < abs(f(x1))
        temp = x0;
        x0 = x1;
        x1 = temp;
end

iter = 0;
err = tol + 1;
while err > tol && iter < max_iter
    x2 = x1 - f(x1)*(x0 - x1)/(f(x0) - f(x1));
    
    err = abs(x2 - x1);
    x0 = x1;
    x1 = x2;
    iter = iter + 1;
end