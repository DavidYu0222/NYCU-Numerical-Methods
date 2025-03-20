table = [0.30 0.3985 0.2613 -0.0064 -0.0022 0.0003;
         0.50 0.6598 0.2549 -0.0086 -0.0018 0.0004;
         0.70 0.9147 0.2464 -0.0104 -0.0014 0.0005;
         0.90 1.1611 0.2360 -0.0118 -0.0010      0;
         1.10 1.3971 0.2241 -0.0128       0      0;
         1.30 1.6212 0.2113       0       0      0;
         1.50 1.8325      0       0       0      0];
h = 0.2;

% a
x1 = 0.72;
i1 = 2; % 0.5, let x1 in the middle of points (0.5, 0.7, 0.9)
ans1 = P(x1, i1, 3, table, h);
fprintf('a: %.8f\n', ans1);

% b
x2 = 1.33;
i2 = 5; % 1.10, let x2 in the middle of point (1.1, 1.3)
ans2 = P(x2, i2, 2, table, h);
fprintf('b: %.8f\n', ans2);

%c 
x3 = 0.50;
i3 = 2; % x3 equal to 0.5, let s be 0
ans3 = P(x3, i3, 4, table, h);
fprintf('c: %.8f\n', ans3);


function result = P(x, start_i, order, table, h)
    s = (x - table(start_i, 1))/h;
    result = table(start_i, 3);
    for j = 2:order
        sum = 0;
        for k = 0:j-1
            product = 1;
            for l = 0:j-1
                if(l ~= k)
                    product = product * (s - l); 
                end
            end
            sum = sum + product;
        end
        sum = sum * table(start_i, j+2)/factorial(j);
        result = result + sum;
    end
    result = result / h;
end

