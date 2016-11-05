function sol = F(x)

f1 = 6*x(1)-2*cos(x(2)*x(3))-1;
f2 = 9*x(2)+sqrt((x(1))^2+sin(x(3))+1.06)+0.9;
f3 = 60*x(3)+3*exp(x(1)*(x(2)))+10*pi - 3;

sol = [f1; f2; f3];

end

