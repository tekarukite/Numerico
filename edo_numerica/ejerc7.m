
clear all; close all; clc;

%Datos iniciales
A = 5*10;      %area tanque
b = 0.2;       %ancho obertura
c_d = 0.65;    %coeficiente de desague
y0 = 0.75;     %condicion inicial
g = 9.81;      %gravedad

f = @(t,y) -2/(3*A)*c_d*b*sqrt(2*g)*y.^(3/2);


%apartat a
npassos = 4;
a = 0;
b = 120;

[x,Y]=Euler(f,a,b,y0,npassos)

plot(x,Y,'-*'), title('Euler')

%apartat b (Runge-Kutta);