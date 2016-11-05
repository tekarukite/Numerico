function [xS3,yS3,coeficients]=dibuixaSplineC1Parabolic(x,y)
% [xd,yd,coeficients]=dibuixaSplineCubic(x,S,dS,d2S)
%
% Funcio per dibuixar un spline parabolic C1
% Llegeix els punts base (x) i les imatges (y)
% Retorna els punts i les imatges, dividint els intervals en 20 parts
% Retorna els coeficients en una matriu nx3

    
    %Variables auxiliars
    x01 = [0:1/20:1];
    xS3 = []; yS3 = []; coeficients = [];
    h=x(2:end)-x(1:end-1);
    n = length(x)-1;
    
    %Aproximacio de la derivada en el primer punt:
    Si = (y(2)-y(1))/h(1);
    
    % Calculem spline Si amb un sistema en que imposem 
    % (parabola <=> 3 graus de llibertat <=> 3 restriccions): 
    % fila 1: interpolar el 1r punt
    % fila 2: derivada al primer punt (la 1a la coneixem: la hem aproximat)
    % fila 3: interpolar el 2n punt
    % Nota: cada spline depen de l'anterior
    for i=1:n
        Mi = [x(i)^2,x(i),1; 2*x(i), 1, 0; x(i+1)^2, x(i+1), 1];
        Bi = [y(i); Si; y(i+1)];
        coef = Mi\Bi;
        coeficients = [coeficients; coef'];
        a = coef(1); b = coef(2); c = coef(3);
        %Derivada al punt de la "dreta": la guardem per la seg?ent iteracio
        Si = 2*a*x(i+1)+b;
        %Actualitza intervals
        xs = x(i)+x01*h(i);
        ys = a*(xs.^2) + b*xs + c; %polinomi avaluat a l'interval
        xS3 = [xS3 xs]; yS3 = [yS3 ys];
    end
% Opcio a dibuixar el polinomi
%     figure(2);
%     plot(xS3,yS3);
end
