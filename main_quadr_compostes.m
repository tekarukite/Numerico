%CONVERGENCIA DE LES QUADATURES COMPOSTES
%L'objectiu d'aquest exercici es comprovar la convergencia de les
%quadratures compostes. Aquest script mostra l'evolucio de l'error en 
%funcio del numero d'avaluacions de la funcio (cost) per a la quadratura 
%composta del trapezi. 
%
%Completa l'script per a dibuixar tambe l'evolucio de l'error per 
%a les quadratures compostes de:
% a) Simpson
% b) Gauss-Legendre amb 2 punts a cada subinterval (n=1)
% c) Gauss-Legendre amb 3 punts a cada subinterval (n=2)
%
%Observa la convergencia assimptotica. Tenen les quadratures el
%comportament esperat?
%
%Representa ara l'error per al segon exemple (paradoja de Runge).
%Compara l'evolucio de l'error amb l'error amb quadratures simples (1 sol
%interval, augmentant n)

clear all; close all; clc

%Exemple 1
f = @(x)( exp(-x)+0.5*exp(-(x-4).^2) ); 
a = 0; b = 5; 
I_ex = exp(-a) - exp(-b) + (1/4)*sqrt(pi)*(erf(b-4) - erf(a-4));



%Exemple 2
%f = @(x)(1./(1+x.^2)); a = -4; b = 4; I_ex = (atan(b) - atan(a)); 

%Dibuixem la funcio
xaxis = a:0.01:b;
figure(1)
plot(xaxis, f(xaxis),'k');

%% Composta de trapezi
errorTrap=[];
for k=1:5
    m = 2*2^k; %numero d'intervals
    errorTrap = [errorTrap, abs(compostaTrapezi(f,a,b,m)-I_ex)];
end
nPuntsTrap = 2*2.^[1:5]+1;
ajustTrap = (polyfit(log10(nPuntsTrap(end-2:end)),log10(errorTrap(end-2:end)),1));

%Grafica errors
figure(2) 
plot(log10(nPuntsTrap),log10(errorTrap),'-o')
hold on
xlabel('log_{10}(#punts)'), ylabel('log_{10}(error)')

fprintf('\nPendent 3 darrers punts:\n Composta trapezi: %0.1f \n',ajustTrap(1))


%% Composta de Simpson
error_Simpson = [];
for k = 2 : 5
    m = 2^k;
    error_Simpson = [error_Simpson, abs(compostaSimpson(f,a,b,m) - I_ex)];
end

nPuntsSimpson = 2*2.^[2:5]+1;
plot(log10(nPuntsSimpson),log10(error_Simpson),'-*')

ajustSimpson = (polyfit(log10(nPuntsSimpson(end-2:end)),log10(error_Simpson(end-2:end)),1));

fprintf('\nPendent 3 darrers punts:\n Composta simpson: %0.1f \n',ajustSimpson(1))

%% Composta de Gauss-Legendre amb n = 1 (2 punts per subinterval)
error_GL1 = []; error_GL2 = [];
for k = 1 : 5
    m = 2^k;
    error_GL1 = [error_GL1, abs(composta_GL(f,a,b,m,1) - I_ex)];
end
for k = 1 : 5
    m = 2^k;
    error_GL2 = [error_GL2, abs(composta_GL(f,a,b,m,2) - I_ex)];
end

nPuntsGauss1 = 2*2.^[1:5];
nPuntsGauss2 = 3*2.^[1:5];
plot(log10(nPuntsGauss1),log10(error_GL1),'-x')
plot(log10(nPuntsGauss2),log10(error_GL2),'-+')
legend('Composta de trapezi','Composta de Simpson', 'Composta de G-L(n=1)', 'Composta de G-L(n=2)')


ajustGauss1 = (polyfit(log10(nPuntsGauss1(end-2:end)),log10(error_GL1(end-2:end)),1));
ajustGauss2 = (polyfit(log10(nPuntsGauss2(end-2:end)),log10(error_GL2(end-2:end)),1));
fprintf('\nPendent 3 darrers punts:\n Composta Gauss (n = 1): %0.1f \n',ajustGauss1(1))
fprintf('\nPendent 3 darrers punts:\n Composta Gauss (n = 2): %0.1f \n',ajustGauss2(1))
