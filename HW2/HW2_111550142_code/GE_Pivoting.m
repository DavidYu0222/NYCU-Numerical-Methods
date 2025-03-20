function x = GE_Pivoting(A, b, pivot, prec)
    % Check if the matrix A is square
    [m, n] = size(A);
    if m ~= n
        error('Matrix A must be square.');
    end

    % Default precision
    if nargin < 4
        prec = -1; % -1 means no use
    end

    % Augmenting the matrix A with vector b
    aug_matrix = [A, b];
    fprintf("Initial:\n");
    disp(aug_matrix);

    % Forward elimination
    for i = 1:m-1
        fprintf("%d iteration:\n", i);
        
        % Partial pivoting
        if(pivot == true)
            [~, idx] = max(abs(aug_matrix(i:m, i)));    % find the largest entry below the diagonal
            idx = idx + i - 1;
            if idx ~= i
                aug_matrix([i, idx], :) = aug_matrix([idx, i], :);  % swap two rows
            end
            fprintf("After partial pivoting:\n");
            disp(aug_matrix);
        end

        % Elimination step
        for j = i+1:m
            m_j = aug_matrix(j, i) / aug_matrix(i, i);   % m(j) = a(j)/a(i)
            aug_matrix(j, :) = aug_matrix(j, :) - m_j * aug_matrix(i, :);
        end
        
        if(prec > 0)
            aug_matrix = round(aug_matrix, prec, 'significant');
        end

        fprintf("After Elimination:\n");
        disp(aug_matrix);
    end

    % Backward substitution
    x = zeros(m, 1);
    for i = m:-1:1  % equl to (i = m; i > 1; i--)
        x(i) = (aug_matrix(i, end) - aug_matrix(i, i+1:end-1)*x(i+1:end)) / aug_matrix(i, i);
    end

    if(prec > 0)
        x = round(x, prec, 'significant');
    end
end