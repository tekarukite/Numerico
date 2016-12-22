function I = s(t,a,m)

f = @(x) norm(dgamma(x));

I_simps = compostaSimpson(f,a,t,m);


end

