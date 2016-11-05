function res = nou_pol_Legendre(x, coefs)

%sabem que al ser un polinomi de grau n ortotonal a una dimensio menys
%aleshores compleix: P_(i+1)(x) = (a_i(x) + b_i)*P_i(x) + c_i*P_(i-1)(x);

n = length(coefs);
L = zeros(n,length(x));
for i=1:length(x)
    L(:,i) = legendreP(0:(n-1),x(i));
end
res = coefs*L;

end

%[~,l]

