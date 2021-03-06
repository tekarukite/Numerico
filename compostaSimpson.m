
function I_aprox = compostaSimpson(f,a,b,m)
%Calcula la integral aproximada amb els splines parabolics c^0 (Simpson)
%I = h/3 * sum{1--m}(f(x(2i-2)) + 4f(x(2i-1)) + f(x(2i)));

x = linspace(a,b,2*m+1);
h = (b-a)/(2*m);

I_aprox = 0; %separamos el primer caso fuera.
for i = 1 : m
    I_aprox = I_aprox + f(x(2*i-1)) + 4*f(x(2*i)) + f(x(2*i + 1));
end

I_aprox = h/3 * I_aprox;

end

