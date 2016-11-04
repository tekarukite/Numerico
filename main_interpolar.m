%APARTAT 1

x = -1:0.01:1;
y = polRunge(x);
%plot(x, y, 'k');
%hold on;
%legend('show');
%interpol;

%APARTAT 2

x = -1:2/100:1;
axisx = -1:0.01:1;
%figure(2);
%plot(axisx,polRunge(axisx), 'k');

f = @(x) 1./(1 + 25 * (x.^2));
%hold on;
for i = 2:2:8
    y = polRunge(x);
    coef = polyfit(x, y, i);
    A = polyval(coef, axisx);
    B = @(x) polyval(coef, x);
    
    phi = @(x)((f(x)-B(x)).^2);
    norma = integral(phi,-1,1);
    %plot(axisx, A);
    %hold on;
    
end

% APARTAT 3
m = [2, 4, 6, 8];
xaxis = -1:0.01:1;
figure(3);
plot(xaxis, polRunge(xaxis), 'k');
hold on;

for j = 1 : length(m);
    grau = m(j);
    for i = 1 : grau
        a(i) = integral(@(x) (legendreP(i - 1, x)).^2, -1, 1);
        b(i) = integral(@(x) (legendreP(i - 1, x) .* polRunge(x)), -1, 1);
        c(i) = b(i) / a(i);
    end
    
    P = @(x) (nou_pol_Legendre(x, c));
    plot(xaxis, P(xaxis));
    hold on;
end




