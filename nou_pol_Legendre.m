function res = nou_pol_Legendre(x, coefs)

n = length(coefs);
L = zeros(n,length(x));
for i=1:length(x)
    L(:,i) = legendreP(0:(n-1),x(i));
end
res = coefs*L;

end

%[~,l]

