clear all; close all; clc;
format long;

%Dades del problema
f = @(x) sin(exp(x));
a = 0;
b = 3;
I_exacta = integral(f,a,b); %0.606124473418770

figure(1)
xaxis = a:0.001:b;
plot(xaxis, f(xaxis),'k');
grid on;
legend('f(x)');
xlabel('x');
ylabel('f(x)');
title('Grafica de la funcio');


%% apartat a
m = [4,8,16,32]; %,64,64*2,64*4

neval_trap = zeros(1,length(m));
err_trap = zeros(1, length(m));
neval_simpson = zeros(1, length(m));
err_simpson = zeros(1, length(m));

for i = 1 : length(m)
    I_trap = compostaTrapezi(f,a,b,m(i));
    %per cada interval al metode de trapezi avaluem m+1 cops la funcio
    neval_trap(i) = m(i) + 1;
    err_trap(i) = abs((I_exacta - I_trap)/I_exacta);
    
    I_simps = compostaSimpson(f,a,b,m(i));
    %per cada interval a simpson avaluem (si lo hacemos una vez por punto)
    %2*m + 1 vegades.
    neval_simpson(i) = 2*m(i) + 1;
    err_simpson(i) = abs((I_exacta - I_simps)/I_exacta);
end
figure(2)
plot(log10(neval_trap), log10(err_trap),'-o');
hold on;
plot(log10(neval_simpson), log10(err_simpson),'-*');
grid on;
legend('Trapezi','Simpson');
xlabel('log(#avaluacions de la funcio)');
ylabel('log(Error relatiu)');
title('Gràfica del error');


%subapartat a
I_trap = compostaTrapezi(f,a,b,64);
err_trap(length(m) + 1 ) = abs(I_exacta - I_trap);

I_simps = compostaSimpson(f,a,b,64);
err_simpson(length(m) + 1) = abs(I_exacta - I_simps);

I_trap = compostaTrapezi(f,a,b,128);
err_trap(length(m) + 2) = abs(I_exacta - I_trap);

I_simps = compostaSimpson(f,a,b,128);
err_simpson(length(m) + 2) = abs(I_exacta - I_simps);

nPuntsTrap = 2*2.^[1:5]+1;
ajustTrap = (polyfit(log10(nPuntsTrap(end-2:end)),log10(err_trap(end-2:end)),1));
fprintf('\nPendent 3 darrers punts:\n Composta trapezi: %0.1f \n',ajustTrap(1));

nPuntsSimpson = 2*2.^[2:5]+1;
ajustSimpson = (polyfit(log10(nPuntsSimpson(end-2:end)),log10(err_simpson(end-2:end)),1));
fprintf('\nPendent 3 darrers punts:\n Composta simpson: %0.1f \n',ajustSimpson(1))


%% apartat b
g = @(x) exp(x).*cos(exp(x)) - exp(2*x).*sin(exp(x));
xaxis = a:0.001:b;
figure(3)
plot(xaxis, g(xaxis));

%metode trapezi
cota = abs(g(3));
m = ((((b-a)^3)*(10^6)*cota)/6)^(1/2);
m = floor(m); %calcula el valor enter
display(m);
I_trap = compostaTrapezi(f,a,b,m);
err_trap = abs(I_exacta - I_trap);
display(err_trap);

%metode de simpson
y = 3;
cota = exp(4*y) + 6* exp(3*y) + 7*exp(2*y) + exp(y);
m = ((((b-a)^5)*(10^6)*cota)/1440)^(1/4);
m = floor(m);
display(m);
I_simps = compostaSimpson(f,a,b,m);
err_simpson = abs(I_exacta - I_simps);
display(err_simpson);

% 
% %% apartat c: demostrar a script
% 
% %% apartat d i e
% tol = 1e-4;
% [I_adapt, punts1] = Simpson_adaptatiu(f,a,b,tol);
% display('Integral aprox amb simpson adaptatiu i nombre de punts amb tol 10^(-4)')
% display(I_adapt);
% Error_simp_adapt = abs(I_adapt - I_exacta);
% display(Error_simp_adapt);
% display(length(punts1));
% 
% figure(3)
% xaxis = a:0.001:b;
% plot(xaxis, f(xaxis),'b');
% set(gca, 'XTick', punts1, 'XTicklabel','');
% hold on
% grid on
% legend('f(x)');
% xlabel('punts de integracio');
% ylabel('f(x)');
% title('Punts de integracio de simpson adaptatiu amb tolerancia = 1e-4');
% 
% 
% plot(punts1, f(punts1), '*');
% 
% %segona part
% tol = 1e-8;
% [I_adapt, punts2] = Simpson_adaptatiu(f,a,b,tol);
% display('Integral aprox amb simpson adaptatiu i nombre de punts amb tol 10^(-8)')
% display(I_adapt);
% Error_simp_adapt = abs(I_adapt - I_exacta);
% display(Error_simp_adapt);
% display(length(punts2));
% 
% figure(4)
% xaxis = a:0.001:b;
% plot(xaxis, f(xaxis),'b');
% hold on
% plot(punts2, f(punts2), '*');
% grid on
% set(gca, 'XTick', punts2, 'XTicklabel','');
% legend('f(x)');
% xlabel('punts de integracio');
% ylabel('f(x)');
% title('Punts de integracio de simpson adaptatiu amb tolerancia = 1e-8');
% 
% %% apartat f
% 
% %%%Tolerancia 1e-04;
% tol = 1e-4;
% niter = 1;
% I_simpson = 0;
% k = 1;
% err_simpson(k) = 1;
% while err_simpson(k) > eps && niter < 100000 %para q no explote por si acaso
%     m2 = 2 * niter;
%     I_simpson = compostaSimpson(f,a,b,m2);
%     err_simpson(k + 1) = abs(I_exacta - I_simpson);
%     niter = m2;
%     k = k + 1;
% end
% display(I_simpson);
% display(m2);
% 
% %%%Altra tolerancia: 1e-8;
% tol = 1e-8;niter = 1;
% I_simpson = 0;
% k = 1;
% err_simpson(k) = 1;
% while err_simpson(k) > eps && niter < 100000 %para q no explote por si acaso
%     m2 = 2 * niter;
%     I_simpson = compostaSimpson(f,a,b,m2);
%     err_simpson(k + 1) = abs(I_exacta - I_simpson);
%     niter = m2;
%     k = k + 1;
% end
% display(I_simpson);
% display(m2);
% 
