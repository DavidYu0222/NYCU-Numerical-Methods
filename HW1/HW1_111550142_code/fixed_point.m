function root = fixed_point(g, x0, tol, max_iter)
    x = x0;
    iter = 0;
    while iter < max_iter
        x_next = g(x);
        if abs(x_next - x) < tol
            root = x_next;
            return;
        end
        x = x_next;
        iter = iter + 1;
    end
    root = x;
end