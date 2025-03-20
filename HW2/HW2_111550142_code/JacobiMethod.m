function [x, iter] = JacobiMethod(A, b, x0, tol, max_iter)
    % Check if the matrix A is square
    [m, n] = size(A);
    if m ~= n
        error('Matrix A must be square.');
    end
    % Starting vector
    x = x0;
    iter = 0;
    while iter < max_iter
        x_new = x;
        % Formula: xi_new = (bi - sigma(aij*xj))/aii, j != i
        for i = 1:m
            % Compute the sum for the non-diagonal elements
            sigma = 0;
            for j = 1:m
                if j ~= i
                    sigma = sigma + A(i,j) * x(j);
                end
            end
            % Update the solution vector
            x_new(i) = (b(i) - sigma) / A(i,i);
        end
        % Check for convergence (maximum(xi_new - xi) < tol)
        if norm(x_new - x, inf) < tol
            x = x_new;
            iter = iter + 1;
            return;
        end
        % Update the solution
        x = x_new;
        iter = iter + 1;
    end
    fprintf("Jacobi's method did not convergent " + ...
        "within the maximum number of iterations.\n");
end