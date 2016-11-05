function coef = interpol;
axisx = -1:0.01:1;
for i = 1:4
    n = 2*i;
    x = -1:2/(2*i):1;
    y = polRunge(x);
    coef = polyfit(x, y, n);
    A = polyval(coef, axisx);
    plot(axisx, A);
    hold on;
end


end

