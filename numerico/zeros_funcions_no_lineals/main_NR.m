
clear all; close all;

%datos iniciales
x0 = [0, 0, 0];
eps = 1e-8;
niter = 10000;

%% METODO DE NEWTON RAPSON
[res, err] = Newton_Raphson(x0, niter, eps);
display(res);

plot(log(err));
hold on;
grid on;

%% METODO DE NEWTON RAPHSON MODIFICAT 
   %amb mateix x0,eps i niter;
[res, err] = Newton_Raphson_mod(x0, niter, eps);
display(res);

plot(log(err));
hold on;

%% METODO DE DERIVACIO NUMERICA

[res, err] = der_numerica(x0, niter, eps);
display(res);

plot(log(err));
hold on;

%% METODO DE BROYDEN

[res, err] = broyden(x0, niter, eps);
display(res);
plot(log(err));
legend('NR','NR-mod', 'der_num', 'broyden');


