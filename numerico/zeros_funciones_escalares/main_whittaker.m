
clear all; close all;

%dades que venen donades
%en aquest cas era la funcio f en l'interval [-1,4];
xaxis = -1:0.01:4;
plot(xaxis, f(xaxis), '.'); % :) he dibuixat la grafica amb punts jeje
legend('f(x)');

%la aproximacio x0 ha de ser bona
x0 = 2;
%la m ha de ser bona (= la primera derivada) perque convergeixi(linealment)
m = -30; 
niter = 200;
eps = 1e-5;
[x, err] = Whittaker( x0, m, niter, eps);
display(x);
display(err);

figure(2);
plot(log(err), '-.');
legend('whittaker');