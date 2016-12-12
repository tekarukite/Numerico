function I_aprox = composta_GL(f,a,b,m,nIP)


x = linspace(a,b,m+1);

[z,w] = QuadraturaGauss(nIP + 1);

I_aprox = 0;
for i = 1 : m
    y = (x(i+1)-x(i))/2*z + (x(i+1)+x(i))/2; %canvi de variable
    I_aprox = I_aprox + w*f(y)*(x(i+1)-x(i))/2;
end

end

