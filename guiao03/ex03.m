%% ex03

Ta = 0.001;             % tempo de amostragem
f0 = 1;                 % freq do sinal composto
Np = 2;                 % nº de periodos a considerar para o sinal resultante

ak = zeros(100,1);      % vetor (Kx1) com os valores de ak da serie
bk = zeros(100,1);      % vetor (Kx1) com os valores de bk da serie

odd = 1:2:100;          % contar de 1 a 100 de 2 em 2 (sempre nº impares)
bk(odd) = 4./(odd*pi);  % valores de bk (4/pi*odd)

% fazendo as contas em papel vemos q b1 = 4/(1*pi), b3 = 4/(3*pi). b5 = 4/(5*pi), etc...
% b0=b2=b4=b6=...= 0
% desta forma entendemos a maneira que é feito o bk(odd) 

[x,t] = funct(Ta,f0,Np,ak,bk);      % chamar a funcao

figure(1);

plot(t,x);

xlabel('t');
ylabel('x(t)');
title("ex03");
grid on;