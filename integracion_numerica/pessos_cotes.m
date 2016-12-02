function W = pessos_cotes(x,a,b)

n = length(x);
%calculem els pessos de newton-cotes
A = zeros(n);
B = zeros(n,1);
for i = 1 : n
    A(i,:) = x.^(i-1);
    B(i) = (b^i - a^i)/i;
end
W = A\B;
end

