function [res, err] = broyden(x0, niter, eps)

%{
---------------------------------------------------------------------
Newton-Raphson sin utilizar la derivada. (version secante en Rn)
----------------------------------------------------------------------
%} 

x = x0;
err(1) = 1;
residu = F(x);
S = Jacob(x);

i = 1;
while i <= niter && err(i) > eps
    increment = -S\residu; %resol S^k * incr(x^k+1) = - F(x^k);
    y = x + increment'; % x^k+1 = x^k + incr(x^k+1)..( o deltaX )
    residu = F(y); 
    
    %actualitzem la matriu S = S^k + u*v' donde:
    u = residu/norm(increment, 2);
    v = increment;
    S = S + u * v';
    
    err(i + 1) = norm(((y - x) / y), 2);
    x = y;
    i = i + 1;
end

res = x;

end

