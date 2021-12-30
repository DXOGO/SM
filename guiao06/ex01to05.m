clear all
clc
%% Considere o seguinte sinal, composto por uma componente determinística (sinusoidede 1 Hz) e uma outra estocástica ( 𝑟(𝑡) ):   

%                                                   𝑥(𝑡) = sin(2𝜋𝑡) + 𝑟(𝑡)

% O sinal de ruído 𝑟(𝑡) é gerado pela seguinte expressão:   ---->     𝑟(𝑡) = 0.5*sin(20𝜋𝑡 + 10*𝜙1(𝑡)) + 0.5*sin(24𝜋𝑡 + 10*𝜙2(𝑡))

% onde 𝜙𝑘(𝑡), 𝑘 = 1,2, é o resultado da integração (ao longo do tempo) de uma variável aleatória de :
    % - distribuição normal
    % - média nula 
    % - desvio padrão igual a 𝜋.

% Crie a função [𝐱,𝐭] = 𝑮𝒆𝒓𝒂𝑺𝒊𝒏𝒂𝒍(𝑁, 𝑇𝑎):
    % - gera a sequência de 𝑁 amostras do sinal definido anteriormente ( x(t) )
    % - considera o período de amostragem 𝑇𝑎
    % - devolve no vetor 𝐱 os valores das amostras
    % - devolve no vetor 𝐭 os respetivos instantes de tempo 
    % - a função deverá, também, representar num gráfico o sinal criado.


%                                          |...|-> matriz Nx1           ^ x(t)
% rn = random('normal',0,pi,N,1)                              |
%                                    | |                                       |
%                                    | > desvio padrão              |
%                                    |                                         |
%                                   média                                 |     <-- Ta -->
%                                                                             |-----------------------> t
%                                                                                   |              |
%                                                                                 k-1            k
%       w(k) = w(k-1) + (( x(k) + x(k-1) ) / 2 ) * Ta        w(k-1)        w(k)

Ta = 0.001;     % periodo de amostragem
N = 1e4;         % nº de amostras

% ex 01)
[x,t] = GeraSinal(N,Ta);

%% ex 02) Usando a função Espetro (criada na Aula 04), observe o espetro do sinal gerado na pergunta anterior. 
% Observe como varia o espetro de diferentes realizações desse sinal, e conclua sobre a localização na frequência das 
% componentes (determinística e ruído) desse sinal.

[X,f] = Espetro(x,Ta,0,55);

%% ex 03) Com base no que observou na alínea anterior, desenvolva um filtro a ser aplicado sobre o espetro
% que permita filtrar (i.e. reduzir ou eliminar) a componente de ruído associada ao sinal gerado na questão 1.
% Aplique esse filtro e, usando a função Reconstroi (também desenvolvida na Aula 04), obtenha o sinal filtrado no domínio do tempo e visualize-o

H = zeros(size(x));
fc = 3;

H( (f>-fc) & (f<fc) ) = 1;    %         1 → entre -fc e fc          → 0 no resto        queremos qd é 1
% tmb pode ser >> H(f>-fc)=1; H(f>fc)=0;

Y = H.*X;
figure(66);
[y,t] = Reconstroi(Y,f);
plot(t,x,t,y);          % mostrar o sinal do ex01 (a azul) e o sinal reconstruido (a vermelho)
legend("função de GeraSinal","função de Reconstroi");

%% ex 04) Repita a alínea anterior, criando agora um filtro que permita obter apenas a
% componente de ruído do sinal gerada na questão 1. Aplique esse filtro e observe, no
% domínio do tempo, o sinal de ruído gerado por este processo de filtragem

G = 1 - H;      % em vez de filtrar a componente de ruido faz o oposto, permite SÓ ver essa componete

Z = G.*X;
figure(88);
[z,t] = Reconstroi(Z,f);
%plot(t,x,t,z);  % mostrar o sinal do ex01 (a azul) e o sinal reconstruido (a vermelho)


%% pergunta 5
ps=sum(Y.^2)/length(Y); % signal (s)
pn=sum(Z.^2)/length(Z); % noise (n)
snr = 10*log10(ps/pn);
fprintf('SNR = %.3f dB\n',snr);
