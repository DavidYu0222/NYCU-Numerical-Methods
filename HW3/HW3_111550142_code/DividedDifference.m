function table = DividedDifference(x, f)
    % The first column of table is x, the second column of table is f[x],
    % the third column is f[xi, xi+1], and so forth.
    table = zeros(length(x), length(x)+1);
    
    table(:,1) = x;
    table(:,2) = f;

    for j = 3:length(x)+1
        for i = 1:length(x)-j+2
            table(i, j) = (table(i+1, j-1) - table(i, j-1))/(table(i+j-2,1) - table(i,1));
        end
    end
end

