function x = GE_ScaledPivoting(A, b, prec)
    % Check if the matrix A is square
    [m, n] = size(A);
    if m ~= n
        error('Matrix A must be square.');
    end

    % Default precision
    if nargin < 3
        prec = -1; % -1 means no use
    end

    % Augmenting the matrix A with vector b
    aug_matrix = [A, b];
    fprintf("Initial:\n");
    disp(aug_matrix);
    
    % Find the scaling factors
    for i = 1:m
        scale(i) = max(abs(A(i,1:m)));
    end

    % Forward elimination with scaled partial pivoting
    for i = 1:m-1
        fprintf("%d iteration:\n", i);
        
        %Scale Partial Pivoting
        [~, idx] = max(abs(aug_matrix(i:m, i))./scale(i:m)); % Find the row with the maximum scaled value
        idx = idx + i - 1;
        if idx ~= i
            scale([i, idx]) = scale([idx, i]);
            aug_matrix([i, idx], :) = aug_matrix([idx, i], :); % swap two rows 
        end
        fprintf("After Scale partial pivoting:\n");
        disp(scale);
        disp(aug_matrix);

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
    x = zeros(n, 1);
    for i = m:-1:1
        x(i) = (aug_matrix(i, end) - aug_matrix(i, i+1:end-1)*x(i+1:end)) / aug_matrix(i, i);
    end

    if(prec > 0)
        x = round(x, prec, 'significant');
    end
end
