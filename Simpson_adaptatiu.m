function [I_aprox, punts] = Simpson_adaptatiu(f,a,b,tol)  %m = 1: simple

S1 = compostaSimpson(f,a,b,1); %he de cambiarlas por simples antes de entregar el trabajo
S2 = compostaSimpson(f,a,(a+b)/2,1);
S3 = compostaSimpson(f,(a+b)/2,b,1);

Error = abs(S1 - (S2 + S3));
if Error < tol*(b-a)
    I_aprox = S1;
    punts = [];
else
    [I1, punts1] = Simpson_adaptatiu(f,a,(a+b)/2,tol);
    [I2, punts2] = Simpson_adaptatiu(f,(a+b)/2,b,tol);
    I_aprox = I1 + I2;
    punts = [punts1, (a+b)/2, punts2]; 
end
end

