
%apartat a;
% Implementa una funció que, donat un valor de t, calculi s(t) usant una quadratura
% composta de Simpson amb m intervals. Determina m per a que s(b) tingui 4
% xifres significatives correctes i escriu el valor obtingut de s(b). Comenta com has
% obtingut aquest valor de m.
% Indicació: executa load corba per carregar la funció gamma i la seva primera
% derivada dgamma, i els extrems a i b que defineixen el seu espai paramètric.

load('corba.mat');
I = s(t);

%apartat b:
m = 100;