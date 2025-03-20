f = @(y, x) sin(x) + y;

x0 = 0;
y0 = 2;

h = 0.001;

y01 = modified_euler(f, y0, x0, h, 0.1);
y05 = modified_euler(f, y0, x0, h, 0.5);

fprintf('y(0.1) = %.5f\n', y01);
fprintf('y(0.5) = %.5f\n', y05);

function y = modified_euler(f, y0, x0, h, xn)
    y = y0;
    for i = x0:h:xn-h    
        % Predicxor:
        y_next = y + h*f(y, i);
        % Correcxor
        y_next = y + 0.5*h*f(y, i) + 0.5*h*f(y_next, i+h);
    
        y = y_next;
    end
end
