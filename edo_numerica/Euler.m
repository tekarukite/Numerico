function [x,Y]=Euler(f,a,b,y0,npassos)

Y = zeros(npassos + 1, 1);
x = zeros(npassos,1)';

h = (b-a)/npassos;
x = a:h:b;
display(x);
Y(1) = y0;

for i = 1 : npassos
    Y(i + 1) = Y(i) + h * f(x(i),Y(i));
end


end

