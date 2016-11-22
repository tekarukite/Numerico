

%% FUNCION 1
a = 0;
b = 5;

eje = linspace(0,6,100);
figure(1)
subplot(1,2,1)
plot(eje,f(eje))
hold on
valorExactoIntegral = exp(-a)-exp(-b) + sqrt(pi)/4*(erf(b-4)-erf(a-4));


%% Cuadratura de Newton-Cotes cerrado: 

valorIntegralNC = [];
for i = 2:14
    n = i;
    x = linspace(a,b,i);
    y = f(x);
    w = newtoncotes(x,a,b);
    valorIntegralNC = [valorIntegralNC y*w];
end

figure(1)
subplot(1,2,2)
l = length(valorIntegralNC);
punts = 1:1:l;
plot(log(punts), log(abs(valorIntegralNC - valorExactoIntegral)),'.-')
hold on