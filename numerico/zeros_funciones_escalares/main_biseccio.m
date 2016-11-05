clear all; close all;

%dades que venen donades
%en aquest cas era la funcio f en l'interval [-1,4];
a = -1;
b = 4;
xaxis = a:0.01:b;
plot(xaxis, f(xaxis), 'k');

iter = 20;
[sol, err] = biseccio(a, b, iter);
display(sol);

figure(2)
plot(log(err), 'b');
display(err);