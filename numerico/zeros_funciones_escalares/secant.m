function [x, err] = secant(x0, x1, niter, eps)

x(1) = x0;
x(2) = x1;
err(2) = abs((x(1) - x(2))/x(2));

i = 2;
while i <= niter && err(i) > eps
    sec = (x(i) - x(i - 1))/(f(x(i)) - f(x(i - 1)));
    aux = f(x(i)) * sec;
    x(i + 1) = x(i) - aux;
    err(i + 1) = abs((x(i + 1) - x(i))/x(i));
    i = i + 1;
end

end

