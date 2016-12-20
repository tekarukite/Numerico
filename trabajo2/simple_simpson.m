function I_aprox = simple_simpson(f,a,b)

x = linspace(a,b,3);
h = (b-a);
I_aprox = h/3*(f(x(1)) + 4*f(x(2)) + f(x(3)));

end

