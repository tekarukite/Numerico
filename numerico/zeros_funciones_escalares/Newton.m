function [x, err ] = Newton(x0, niter, eps)

err(1) = 1;
x(1) = x0;

i = 1;
while i <= niter && err(i) > eps %sale por las iteraciones o por eps
    aux = f(x(i))/der(x(i));
    x(i + 1) = x(i) - aux;
    err(i + 1) = abs((x(i) - x(i + 1))/x(i + 1));
    i = i + 1;
end


end

