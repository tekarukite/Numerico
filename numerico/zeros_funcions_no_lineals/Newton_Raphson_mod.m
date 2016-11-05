function [res, err] = Newton_Raphson_mod(x0, niter, eps)
%{
---------------------------------------------------------------------
Es com el de newton-raphson, pero modificat i lineal
Ens quedem amb la jacobiana en el punt x0
OBS: la jacobiana la podem descomposar i fer servir la factoritzacio 
per resoldre el sistema en cada iteracio.

----------------------------------------------------------------------
%}

x = x0;
err(1) = 1;
J = Jacob(x);
%{
syms X Y Z;
x = [X; Y; Z];   (nota: no se puede poner ' con notacion simbolica);
diff(f(x), x);
%}


i = 1;
while i <= niter && err(i) > eps
    increment = -J\F(x);  %resol el sistema sense fer inversa;
    y = x + increment';
    err(i + 1) = norm(((y - x) / y), 2);
    x = y;
    i = i + 1;
end

res = x;

end

