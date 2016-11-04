
%Datos que nos dan
x = -1:0.01:1;
y = polRunge(x);

%para hacer el subplot(las cuatro imagenes) necesito poner figure;
figure;
%subplot(files, columnes, donde se situa);
subplot(2,2,1);
plot(x, y, 'k');
hold on;
legend('show');
interpol;

%APARTAT 2

x = -1:2/100:1;
axisx = -1:0.01:1;
subplot(2,2,2);
plot(axisx,polRunge(axisx), 'k');

f = @(x) 1./(1 + 25 * (x.^2));
hold on;
for i = 2:2:8
    y = polRunge(x);
    coef = polyfit(x, y, i);
    A = polyval(coef, axisx);
    B = @(x) polyval(coef, x);
    
    phi = @(x)((f(x)-B(x)).^2);
    norma = integral(phi,-1,1);
    plot(axisx, A);
    hold on;
    
end

% APARTAT 3 : interpolacio polinomica amb polinomis de legendre
m = [2, 4, 6, 8];
xaxis = -1:0.01:1;
subplot(2,2,3);
plot(xaxis, polRunge(xaxis), 'k');
hold on;

for j = 1 : length(m)
    grau = m(j);
    %calculem els coeficients del polinomi que busquem amb els de legendre.
    for i = 1 : grau + 1
        a(i) = integral(@(x) (legendreP(i - 1, x)).^2, -1, 1);
        b(i) = integral(@(x) (legendreP(i - 1, x) .* polRunge(x)), -1, 1);
        c(i) = b(i) / a(i); 
        %al ser ortogonal la matriu del producte escalar es diagonal
    end
    
    %multipliquem els coeficients pels polinomis de 
    P = @(x) (nou_pol_Legendre(x, c));
    plot(xaxis, P(xaxis));
    hold on;
end
legend('show');


%APARTAT 4: interpolacio polinomica amb els polinomis de chebyshev
m = [2, 4, 6, 8];
xaxis = -1:0.01:1;
subplot(2,2,4);
plot(xaxis, polRunge(xaxis),'k'),
hold on;
for j = 1 : length(m)
    grau = m(j);
    %calculem els coeficients del polinomi per aplicar despres chebyshev.
    w = @(x) ((1 - (x.^2)).^(-1/2));
    a = zeros(1, grau + 1);
    b = zeros(1, grau + 1);
    coef = zeros(1, grau + 1);
    for i = 1 : grau + 1
        cheb = @(x) (chebyshevT(i - 1, x));
        a(i) = integral(@(x) (w(x) .* (cheb(x).^2)), -1, 1);
        b(i) = integral(@(x)(w(x).*cheb(x).*polRunge(x)), -1, 1);
        coef(i) = b(i) / a(i);
    end
    
    C = @(x) (nou_pol_cheb(x, coef));
    plot(xaxis, C(xaxis));
    hold on;
end
legend('show');

%No donen el mateixos polinomis, ja que els pessos que els hem possat son
%diferents. El polinomi de legendre es el que més s'assemble al




