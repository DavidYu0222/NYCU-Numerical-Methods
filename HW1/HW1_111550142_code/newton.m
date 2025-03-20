function [root, iter] = newton(f, J, x0, tol, max_iter)
    iter = 0;
    x = x0;
    while iter < max_iter
        s = -J(x) \ f(x);   % "x = A\b" equal to solve Ax = b;
        x = x + s;
        if norm(s) < tol
            root = x;
            return;
        end
        iter = iter + 1;
    end
    error(['Newton''s method did not converge ' ...
        'within the maximum number of iterations.']);
end