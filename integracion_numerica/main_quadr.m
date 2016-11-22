clear all; close all;

% FUNCIO EXPONENCIAL

a = 0;
b = 5;

n = 4;
x = a:(b-a)/n:b;
f = @(x) exp(-x) + 1/2*exp(-(x-4).^2);

xaxis = a:0.01:b;
plot(xaxis, f(xaxis));

W = newtoncotes(x,a,b); %et dona els pesos

%sumes el producte de pesos per f per que et doni el valor de la integral.
res = 0;
for i=1:n+1
    res = res+W(i)*f(x(i));
end

sol_exacta = exp(-a)-exp(-b)+sqrt(pi)/4*(erf(b - 4)-erf(a - 4));
display(sol_exacta);

resta = abs(sol_exacta - res);
display(resta);

%Anem a calcular l'error: log(npunts) vs log(relError) fins a 14;
m = 14;
err = 1;
for i = 1 : m
    punts(i) = i;
    x = a:(b-a)/i:b;
    W = newtoncotes(x,a,b);
    
    res = 0;
    for j=1:i
        res = res+W(j)*f(x(j));
    end
    display(res);
    
    err = [err; abs((res - sol_exacta))];
end
figure(2);
punts(m + 1) = m;

display(punts);
display(err);
plot(log(punts), log(err), '*-');





