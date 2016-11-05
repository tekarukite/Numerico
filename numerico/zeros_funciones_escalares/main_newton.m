
clear all; close all;

%dades que venen donades
%en aquest cas era la funcio f en l'interval [-1,4];
xaxis = -1:0.01:4;
plot(xaxis, f(xaxis), 'k');

x0 = 4;
niter = 5;
eps = 1e-8;
[x,err] = Newton(x0, niter, eps);
display(x);
display(err);

%dibuixarem la grafica del error (iter <-> log(err(x^k)));
figure(2);
plot(log(err), 'r');