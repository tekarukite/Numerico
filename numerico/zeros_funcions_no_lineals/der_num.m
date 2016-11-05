function J = der_num(x)

x = x';
n = length(x);
E = eye(n);
J = zeros(n);
h = 1e-6;

for i = 1 : n
    J(:,i) = (F(x + h*E(:,i)) - F(x))/h;
end
display(J);
end

