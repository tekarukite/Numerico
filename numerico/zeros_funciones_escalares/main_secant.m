
clear all; close all;
%{
dades que venen donades
en aquest cas era la funcio f en l'interval [-1,4];
%}

xaxis = -1:0.01:4;
plot(xaxis, f(xaxis), 'k');

x0 = 1;
x1 = 3;
niter = 20;
eps = 1e-8;
[x, err] = secant(x0, x1, niter, eps);
display(x);
display(err);

plot(log(err), 'g');

