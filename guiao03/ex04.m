%% Use a função desenvolvida na pergunta 3 para verificar que um sinal periódico par tem todos 
% os coeficientes 𝑏𝑘 nulos, e que um sinal periódico ímpar tem todos os coeficientes 𝑎𝑘 nulos

Ta = 0.001;     % tempo de amostragem
f0 = 1;         % freq do sinal composto
Np = 6;         % nº de periodos

ak = zeros(100,1);      % vetor (Kx1) com os valores de ak da serie
bk = zeros(100,1);      % vetor (Kx1) com os valores de bk da serie


%% Pares (simétrico pelo eixo dos y):

even = 2:2:100;         % contar de 2 em 2 de 2 a 100 (só numeros pares)
ak(even) = 4./(even*pi);
[x,t] = funct(Ta,f0,Np,ak,bk);

% fazendo as contas em papel vemos q a2 = 4/(2*pi), a4 = 4/(4*pi). a6 = 4/(6*pi), etc...
% a1=a3=a5=a7=...= 0
% desta forma entendemos a maneira que é feito o ak(even) 

figure(1);
subplot(2,2,[1,2]);
hold on;

plot(t,x);

xlabel('t');
ylabel('x(t)');
title("Grafico Onda Sinusoidal Par");
grid on;

%% Impares (simétrico pelo reta y = x):

ak = zeros(100,1);          % uma coluna de 100 linhas todas com o valor 0
bk(even) = 4./(even*pi);    % valores de bk (4/pi*odd)

% fazendo as contas em papel vemos q b2 = 4/(2*pi), b4 = 4/(4*pi). b6 = 4/(6*pi), etc...
% b1=b3=b5=b7=...= 0
% desta forma entendemos a maneira que é feito o bk(even) 

[x,t] = funct(Ta,f0,Np,ak,bk);

figure(1);
subplot(2,2,[3,4]);
hold on;

plot(t,x);

xlabel('t');
ylabel('x(t)');
title("Grafico Onda Sinusoidal Impar");
grid on;