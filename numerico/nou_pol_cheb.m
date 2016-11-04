function res = nou_pol_cheb(x,coefs)


n = length(coefs);
L = zeros(n,length(x));
for i=1:length(x)
    L(:,i) = chebyshevT(0:(n-1),x(i));
end
res = coefs*L;

end

