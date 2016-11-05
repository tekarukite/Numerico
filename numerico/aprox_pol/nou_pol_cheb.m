function res = nou_pol_cheb(x,coefs)

%T_n = cos(n*arccosx);
%T_n+1(x) = 2xT_n(x)-T_(n-1)(x)

n = length(coefs);
L = zeros(n,length(x));
for i=1:length(x)
    L(:,i) = chebyshevT(0:(n-1),x(i));
end
res = coefs*L;

end

