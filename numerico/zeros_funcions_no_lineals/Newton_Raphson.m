function [res, err] = Newton_Raphson(x0, niter, eps)
%{
---------------------------------------------------------------------
analeg amb el mètode de Newton de una variable, pero
se canvia la f(x^k)/f'(x^k) per J(x^k)^(-1) * f(x^k);

No es calcula la jacobiana a cada punt, sino que es resol el sistema:
J(x^k)delta(x^k) = -f(x^k);
----------------------------------------------------------------------
%}

x = x0;
err(1) = 1;

%{
syms X Y Z;
x = [X; Y; Z];   (nota: no se puede poner ' con notacion simbolica);
diff(f(x), x);
%}


i = 1;
while i <= niter && err(i) > eps
    increment = -Jacob(x)\F(x)
    y = x + increment'
    err(i + 1) = norm(((y - x) / y), 2);
    x = y;
    i = i + 1;
end

res = x;

end

