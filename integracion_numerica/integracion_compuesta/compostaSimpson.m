%Creo que esta mal, porque hay el doble de subintervalos que en trapezi.

function I_aprox = compostaSimpson(f,a,b,m)
%Calcula la integral aproximada amb els splines parabolics c^0 (Simpson)
%I = h/3 * sum{1--m}(f(x(2i-2)) + 4f(x(2i-1)) + f(x(2i)));

x = linspace(a,b,2*m+2);
h = (b-a)/(2*m);

I_aprox = f(a) + 4 * f(x(1)) + f(x(2)); %separamos el primer caso fuera.
for i = 2 : m
    I_aprox = I_aprox + f(x(2*i-2)) + 4*f(x(2*i-1)) + f(x(2*i));
end

I_aprox = h/3 * I_aprox;

end

