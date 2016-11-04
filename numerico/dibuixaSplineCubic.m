function [xd,yd,coeficients]=dibuixaSplineCubic(x,S,dS,d2S)
% [xd,yd,coeficients]=dibuixaSplineCubic(x,S,dS,d2S)
%
% Funció per dibuixar un spline cúbic C2
% x  : coordenades dels punts base
% S  : valors de la funció als punts base
% dS : valors de la segona derivada o []
% d2S: valors de la segona derivada o [] (només es fa servir si dS=[])
%
% Es pot dibuixar amb
%  plot(xd,yd)
%

xd = []; yd = []; coeficients = [];
x01 = [0:1/20:1]; %20 subintervals a cada interval

h=x(2:end)-x(1:end-1);
t=S(2:end)-S(1:end-1);

if isempty(dS)
    %AMB CURVATURES
    %Bucle en intervals
    for i=1:length(x)-1
        a = (d2S(i+1)-d2S(i))/(6*h(i));
        b = d2S(i)/2 ;
        c = (t(i)/h(i) - h(i)*(d2S(i+1)+2*d2S(i))/6);
        d = S(i) ;
        xs = x(i)+x01*h(i); %valors de x a l'interval
        ys = a*(xs-x(i)).^3 + b*(xs-x(i)).^2 + c*(xs-x(i)) + d;
        xd = [xd xs]; yd = [yd ys]; coeficients=[coeficients; a b c d];
    end
else
    %AMB DERIVADES
    for i=1:length(x)-1
        a = ( h(i)*(dS(i)+dS(i+1))-2*t(i) )/(h(i)^3);
        b = ( 3*t(i)-h(i)*(2*dS(i)+dS(i+1)) )/(h(i)^2);
        c = dS(i);
        d = S(i) ;
        xs = x(i)+x01*h(i); %valors de x a l'interval
        ys = a*(xs-x(i)).^3 + b*(xs-x(i)).^2 + c*(xs-x(i)) + d;
        xd = [xd xs]; yd = [yd ys]; coeficients=[coeficients; a b c d];
    end
end

%plot(xd,yd);