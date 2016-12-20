
f = @(x) sin(exp(x));
a = 0;
b = 3;
I_exacta = integral(f,a,b); %0.606124473418770

figure(1)
xaxis = a:0.001:b;
plot(xaxis, f(xaxis),'k');

%apartat a
m = [4,8,16,32]; %,64,64*2,64*4

neval_trap = zeros(1,length(m));
err_trap = zeros(1, length(m));
neval_simpson = zeros(1, length(m));
err_simpson = zeros(1, length(m));

for i = 1 : length(m)
    I_trap = compostaTrapezi(f,a,b,m(i));
    %per cada interval al metode de trapezi avaluem m+1 cops la funcio
    neval_trap(i) = m(i) + 1;
    err_trap(i) = abs(I_exacta - I_trap);
    
    I_simps = compostaSimpson(f,a,b,m(i));
    %per cada interval a simpson avaluem (si lo hacemos una vez por punto)
    %2*m + 1 vegades.
    neval_simpson(i) = 2*m(i) + 1;
    err_simpson(i) = abs(I_exacta - I_simps);
end
figure(2)
plot(log10(neval_trap), log10(err_trap),'-o');
hold on;
plot(log10(neval_simpson), log10(err_simpson),'-*');

%apartat b
eps = 1e-6;
niter = 1;
I_trap = 0;
k = 1;
err_trap(k) = 1;
while err_trap(k) > eps && niter < 100000
    m1 = 2 * niter;
    I_trap = compostaTrapezi(f,a,b,m1);
    err_trap(k + 1) = abs(I_exacta - I_trap);
    niter = m1;
    k = k + 1;
end
display(I_trap);
display(m1);

%ara farem el mateix amb simpson
niter = 1;
I_simpson = 0;
k = 1;
err_simpson(k) = 1;
while err_simpson(k) > eps && niter < 100000 %para q no explote por si acaso
    m2 = 2 * niter;
    I_simpson = compostaSimpson(f,a,b,m2);
    err_simpson(k + 1) = abs(I_exacta - I_simpson);
    niter = m2;
    k = k + 1;
end
display(I_simpson);
display(m2);

%apartat c: demostrar a script (no se com demostrar-ho facil)

%apartat d i e
tol = 1e-4;
[I_adapt, punts] = Simpson_adaptatiu(f,a,b,tol);
display(I_adapt);
display(length(punts));

figure(3)
xaxis = a:0.001:b;
plot(xaxis, f(xaxis),'b');
hold on
plot(punts, f(punts), '*');

%segona part
tol = 1e-8;
[I_adapt, punts] = Simpson_adaptatiu(f,a,b,tol);
display(I_adapt);
display(length(punts));

figure(4)
xaxis = a:0.001:b;
plot(xaxis, f(xaxis),'b');
hold on
plot(punts, f(punts), '*');

