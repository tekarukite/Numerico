function W = newtoncotes( x,a,b )
    n = length(x);
    
    %Amb la matriu de la base original
    
    %Es de la forma [1...1; x0 x1 ... xn; ... ;x0^n x1^n ... xn^n]*w=sol;
    
    A = zeros(n, n); %la matriz
    sol = zeros(n, 1); %el "vector b" del sistema lineal Ax = b;
    
    for i = 1:n
        A(i,:) = x.^(i-1);
        sol(i) = (b^i - a^i)/i;
    end
    
    W = A\sol;
    display(W); 
    
    
%-----------------------------------------------------------------------
    
    
    %si ho volem fer per la matriu de la base de lagrange.
    %{
    
                          (tambe funciona)
    
    for i = 1 : n
        %calculem polinomi de lagrange
        L= @(y) 1;
        for j=1:n
            if j~=i
                L=@(y) L(y).*(y-x(j))./(x(i)-x(j));
            end
        end
        W(i) = integral(@(y) L(y), a, b);
    end
    %}
end

