function [res, err] = der_numerica(x0, niter, eps)
%{
---------------------------------------------------------------------
Newton-Raphson sin utilizar la derivada.
Se utiliza una aproximacion de la derivada: (f(x + h) - f(x))/ h;
----------------------------------------------------------------------
%} 

x = x0;
err(1) = 1;

i = 1;
while i <= niter && err(i) > eps
    increment = -der_num(x)\F(x) %calcula la aprox de la jacobiana
    y = x + increment'
    err(i + 1) = norm(((y - x) / y), 2);
    x = y;
    i = i + 1;
end

res = x;

end
