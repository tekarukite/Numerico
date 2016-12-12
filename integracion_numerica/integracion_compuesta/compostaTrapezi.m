function Iaprox=compostaTrapezi(f,a,b,m)

x = linspace(a,b,m+1); %punts equiespaiats

h =(b-a)/m; %mateixa longitud als subintervals

fxint = feval(f,x(2:end-1)); %funcio als punts interiors

Iaprox = feval(f,a)*h/2 + sum(fxint)*h + feval(f,b)*h/2; 

%formula: h/2 * (f(x0) + (2 * sum {de 1 a n - 1} f(xi)) + f(xn));

end
