function [sol, err] = biseccio(a, b, niter)

if f(a) * f(b) > 0
    disp('error en el interval escollit');
    err(1) = Inf;
    sol = -Inf;
    return;
end

%si ens donen el nombre d'iteracions
for i = 1 : niter
    m = (a + b)/2;
    if f(m)*f(a) < 0
        err(i) = abs((m - a)/m);
        b = m;
    end
    if f(m)*f(a) > 0
        err(i) = abs((m - b)/m);
        a = m;
    end
end

sol = (a + b) / 2;

end

