function [x, err] = Whittaker( x0, m, iter, eps)

x(1) = x0;
err(1) = 1;

i = 1;
while i <= iter && err(i) > eps
    x(i + 1) = x(i) - f(x(i))/m;
    err(i + 1) = abs((x(i + 1) - x(i))/x(i + 1));
    i = i + 1;
end


end
