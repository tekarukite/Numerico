function [ Iaprox ] = compostaGauss (df,a,b,m)
%
Iaprox = 0;
x = linspace(a,b,m+1);
for i = 1:m
    [p,w] = QuadraturaGauss(2);
    y = df(p,x(i),x(i+1));
    Iaprox = Iaprox + w*y;
end

end

