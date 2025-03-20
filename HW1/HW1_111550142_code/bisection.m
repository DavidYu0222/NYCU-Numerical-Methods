function [root, iter]= bisection(f, a, b, tol, max_iter)
    if sign(f(a)) == sign(f(b))
        error(['Function has same signs at both ends of the interval.' ...
            ' Bisection method cannot guarantee convergence.'])
    end
    
    iter = 0;
    while (b - a) / 2 > tol && iter < max_iter
        c = (a + b) / 2;
        if f(c) == 0
            root = c;
            return;
        elseif(f(c) * f(a) >= 0) % sign(f(c)) == sign(f(a)) 
            a = c;
        else
            b = c;
        end
        iter = iter + 1;
    end
    root = (a + b) / 2;
end
