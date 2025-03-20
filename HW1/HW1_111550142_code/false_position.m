function [x2, iter] = false_position(f, x0, x1, tol, max_iter)

x2 = x1 - f(x1)*(x0 - x1)/(f(x0) - f(x1));

iter = 0;
while abs(f(x2)) > tol && iter < max_iter
   x2 = x1 - f(x1)*(x0 - x1)/(f(x0) - f(x1));
   
   if(f(x2) * f(x0) < 0) 
       x1 = x2;
   else
       x0 = x2;
   end
   iter = iter + 1;
end