A = [2,-1, 3, 2;
     2, 2, 0, 4;
     1, 1,-2, 2;
     1, 3, 4,-1];

[m, n] = size(A);

L = zeros(4, 4);

% Forward elimination
for i = 1:m
    fprintf("%d iteration:\n", i);
    
    L(i, i) = 1;

    % Elimination step
    for j = i+1:m
        m_j = A(j, i) / A(i, i);   % m(j) = a(j)/a(i)
        L(j, i) = m_j;
        A(j, :) = A(j, :) - m_j * A(i, :);
    end

    fprintf("After Elimination:\n");
    disp(A);
    disp(L);
end

L = L.*2;
A = A./2;
fprintf("L:\n")
disp(L);
fprintf("U:\n")
disp(A);
