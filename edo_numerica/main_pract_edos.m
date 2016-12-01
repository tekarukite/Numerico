clear all; close all;
% Objectius:
% - Entendre els conceptes basics dels metodes per a la resolucio numerica
% d'EDOs.
% - Implementar un metode per resoldre EDOs (metode d'Euler)
% - Comprovar experimentalment la convergencia d'un metode
%
% Tasques a fer:
% 1) Executar i mirar aquest script per veure com es pot resoldre el 
%    problema de valor inicial (PVI) amb la funcio de Matlab ode45
% 2) Implementar el metode d'Euler per a la resolucio del mateix PVI
%    Cal crear la funcio Euler amb els arguments d'entrada i sortida
%    especificats a aquest script. 
% 3) Dibuixar una grafica de log10(abs(error)) en funcio de log10(h), on l'error
%    s'evalua com la diferencia entre la solucio analitica i la solucio
%    numerica per x=2. Comprovar si l'ordre de convergencia coincideix amb
%    el teoric.
% Es proposa ara resoldre el PVI y''= -y, y(0)=1, y'(0)=0 per x en (0,T)
% 4) Reduir la EDO de segon ordre a un sistema d'EDOs de 1er ordre
%    Resoldre numericament el PVI amb el metode d'Euler per T=2*pi. Comprovar
%    la converg?ncia.
% 5) Amb h=0.01 resoldre el problema per T=10*pi,50*pi. ?s el m?tode
%    (absolutament) estable? 


% Resolucio de la EDO dy/dx = -y/(10x+1) per x en (0,1) 
% amb condicio inicial y(0)=1
f=@(x,y) -y/(10*x+1); a=0; b=1;  y0=1;

%Solucio amb funcions intrinseques de Matlab
[x,Y]=ode45(f,[a,b],y0);
figure(1), plot(x,Y,'-*'), title('ode45')

%Solucio amb el metode d'Euler (endavant)
 h=0.1;
 npassos=ceil((b-a)/h); 
 [x,Y]=Euler(f,a,b,y0,npassos);
 figure(2), plot(x,Y,'-*'), title('Euler')
 
     %dibuixarem la edo amb x = 2;
 edo_exacta = @(x) 1./(10*x+1).^(1/10);
 xaxis = a:0.01:b;
 figure(3)
 plot(xaxis,edo_exacta(xaxis)), title('Solucio_edo_x=2');
 
 %3) veurem la diferencia de la edo amb la solucio x = 2;
 err = zeros(npassos + 1,1);
 for i = 1 : npassos + 1
     err(i) = abs(Y(i) - edo_exacta(x(i)));
 end
 
 figure(4)
 plot(x, log10(err)), title('Grafica de l,error')
 
 
 