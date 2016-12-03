clear all; close all;

%funcion1: exponencial
f = @(x) exp(-x) + 1/2.*exp(-(x-4).^2);
a = 0; b = 5;

%funcion2: racional
%f = @(x) 1./(1+x^2);
%a = -4; b = 4;

%funcion3 : trigonometrica
% f = @(x) x./sin(x);
% a = 0; b = pi/2;


%FUNCION (la dibujamos)

xaxis = a:0.01:b;
figure(1)
plot(xaxis, f(xaxis)), title('e^(-x) + 1/2*e^(-(x-4)^2)');

%QUADRATURA DE NEWTON_COTES
%Calculem el valor real de la integral i els valors dels pessos.
n = 4;
I_exacta = exp(-a)-exp(-b)+sqrt(pi)/4*(erf(b-4)-erf(a-4));
display(I_exacta);

x = a:(b-a)/n:b;
W = pessos_cotes(x,a,b);

%sumarem la integral;
Iaprox = 0;
for i = 1 : n + 1
    Iaprox = Iaprox + W(i)*f(x(i));
end
display(Iaprox);

error = abs(Iaprox - I_exacta);
display(error);


%Calculem l'error dividint l'interval [a,b] en n punts on n = 1,...14
for k = 1:14
    x = a:(b-a)/k:b;
    W = pessos_cotes(x,a,b);
    display(W);
    display(f(x));
    sumands = W.*f(x)';
    I_aprox = sum(sumands);
    display(I_aprox);
    err(k) = abs(I_aprox-I_exacta);
end
%Fem la grafica del log del error en funcio del logaritme del nombre de pts
punts = 1:1:14;
display(punts);
figure(2)
plot(log10(punts), log10(err),'r'), title('grafica del error');
hold on;

%OBS: A Raquel le ha quedado igual, asi que seguramente esta bien

%% ARA CALCULAREM LES QUADRATURES AMB ELS PUNTS DE GAUSS

nIP = 4;
[z,w] = QuadraturaGauss(nIP + 1);

%Hacemos el cambio de variable de [-1,1] a [a,b];
%z = (b-a)/2*x + (b+a)/2 i la funcio fent el canvi de variable es
%multiplica per (b-a)/2;

x = (b-a)/2*z + (b+a)/2;
display(w);
display(f(x));
sumands = w*f(x)*(b-a)/2;
I_aprox = sum(sumands);
display(I_aprox);

for k = 1:13
    [z,w] = QuadraturaGauss(k + 1);
    x = (b-a)/2*z + (b+a)/2; %canvi de variable
    I_aprox = w*f(x)*(b-a)/2;
    display(I_aprox);
    err_gauss(k) = abs(I_aprox - I_exacta);
end

plot(log10(1:1:13), log10(err_gauss),'b');

