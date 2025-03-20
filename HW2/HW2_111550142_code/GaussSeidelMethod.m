function [x, iter] = GaussSeidelMethod(A, b, x0, tol, max_iter)
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
        % Formula: xi_new = (bi - sigma[i+1:n](aij*xj) - sigma[1:i-1](aij*xj_new))/aii
        for i = 1:m
            sigma_1 = 0;
            for j = i+1:m
                sigma_1 = sigma_1 + A(i,j) * x(j);
            end
            sigma_2 = 0;
            for j = 1:i-1
                sigma_2 = sigma_2 + A(i,j) * x_new(j);
            end
            % Update the solution vector
            x_new(i) = (b(i) - sigma_1 - sigma_2) / A(i,i);
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
    fprintf("GaussSeidel's method did not convergent " + ...
        "within the maximum number of iterations.\n");
end

