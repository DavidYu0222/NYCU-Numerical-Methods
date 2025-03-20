function root = muller(f, x0, x1, x2, tol, max_iter)
    iter = 0;
    while iter < max_iter
        h1 = x1 - x0;
        h2 = x2 - x1;
        d1 = (f(x1) - f(x0)) / h1;
        d2 = (f(x2) - f(x1)) / h2;
        
        a = (d2 - d1) / (h2 + h1);
        b = a * h2 + d2;
        c = f(x2);       
        D = sqrt(b^2 - 4 * a * c);
        
        if abs(b + D) > abs(b - D)
            E = b + D;
        else
            E = b - D;
        end
        
        dxr = -2 * c / E;
        x3 = x2 + dxr;
        
        if abs(dxr) < tol * max(abs(x2), 1)
            root = x3;
            return;
        end
        
        x0 = x1;
        x1 = x2;
        x2 = x3;
        
        iter = iter + 1;
    end
    root = x3;
end