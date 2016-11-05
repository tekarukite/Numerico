% CALCUL I DIBUIX D'SPLINES
% Aquest script calcula i dibuixa l'Spline cubic C1 amb aproximació de les
% derivades, per als punts base i valors de la funcio a x i y.
%
% EXERCICIS:
% (1) Mira l'ajuda i el codi de la funcio dibuixaSplineCubic per veure que fa.
% (2) Implementa una funcio amb capçalera 
%        function d2S = calculaCurvaturesSplineNatural(x,y)
%     que donats x i y, calculi les curvatures als punts base corresponents
%     a l'Spline natural. Descomenta les linies corresponents a l'Spline
%     natural a aquest codi. Observa els dos Splines. Son raonables els
%     resultats?
% (3) Implementa l'Spline C1 parabolic fent una aproximació de la derivada
%     per al primer punt. Dibuixa l'aproximació obtinguda.
% (4) Per a cada un dels Splines dibuixa (i) l'aproximació amb les dades
%     donades i (ii) modificant el valor del 3er punt de 1 a 2. Observa
%     on i quant afecta la modificació del valor en cada cas.
% (5) Dibuixa la base de cada un dels Splines. Es una base local? Explica
%     aixó el comportament dels Spline a l'apartat anterior?
%     (Pot ser util la funcio subplot)

%Dades
x = [0,1,3,4,5,7]; y = [1,1.25,1,0.5,0,0.4];
%x = [0,1,3,4,5,7]; y = [1,1.25,2,0.5,0,0.4];

%Spline C1 cubic amb aproximacio de les derivades
i = 2:length(x)-1;
dS = [ (y(2)-y(1))/(x(2)-x(1)) (y(i-1)-y(i+1))./(x(i-1)-x(i+1)) (y(end)-y(end-1))/(x(end)-x(end-1))]
[xS1,yS1,coeficients]=dibuixaSplineCubic(x,y,dS,[]);
coeficients
figure(1)
plot(xS1,yS1,'r-',x,y,'ko','LineWidth',2)
legend('C1 cubic')

% %Spline natural
 d2S = calculaCurvaturesSplineNatural(x,y)
 [xS2,yS2,coeficients]=dibuixaSplineCubic(x,y,[],d2S);
 coeficients
 figure(1)
 plot(xS1,yS1,'r-',xS2,yS2,'b-',x,y,'ko','LineWidth',2)
 legend('C1 cubic','Natural')
% 
 %Spline parabolic C1 (recurrent)
 [xS3,yS3,coeficients]=dibuixaSplineC1Parabolic(x,y);
 coeficients
 figure(1)
 plot(xS1,yS1,'r-',xS2,yS2,'b-',xS3,yS3,'g-',x,y,'ko','LineWidth',2)
 legend('C1 cubic','Natural','parabolic')

