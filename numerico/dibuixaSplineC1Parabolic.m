function [xS3,yS3,coeficients]=dibuixaSplineC1Parabolic(x,y)

%
% Funci� per dibuixar un spline c�bic C2
% x  : coordenades dels punts base
% S  : valors de la funci� als punts base
% dS : valors de la segona derivada o []
% d2S: valors de la segona derivada o [] (nom�s es fa servir si dS=[])
%
% Es pot dibuixar amb
%  plot(xd,yd)
%

xd = []; yd = []; coeficients = [];
x01 = [0:1/20:1]; %20 subintervals a cada interval

h=x(2:end)-x(1:end-1);

der_0 = y

for i = 1 : n
    
end




 
end


