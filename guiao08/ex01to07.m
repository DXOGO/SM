clear all
clc
load('Mensagem.mat');
%% ex01 - a variável Mensagem contém uma sequência de carateres (string) que compõem uma
% determinada mensagem. Desenvolva a função: Simbolos = Alfabeto1(Texto)
% que devolve, na variável Simbolos, a lista de carateres que são usados para compor o texto passado na string Texto,

disp("exercicio 1)");
Simbolos = Alfabeto1(Mensagem)

%% ex02 - Desenvolva, agora, a função: [Simbolos,Frequencia] = Alfabeto2(Texto)
% que adicione à função anterior a capacidade de devolver, também, a frequência com
% que cada um dos símbolos identificados aparece no texto da variável passada como argumento

fprintf("\nexercicio 2)\n");
[Simbolos,Frequencias] = Alfabeto2(Mensagem)

%% ex03 - Defina um código binário para os símbolos identificados nas alíneas anteriores, sendo
% que todos os códigos têm o mesmo número de bits. Quantos bits seriam necessários para representar o texto contido em Mensagem

%uma maneira (ordem normal):

% Q - 0 0 0 0 
% W - 0 0 0 1
% S - 0 0 1 0
% D - 0 0 1 1 
% X - 0 1 0 0
% C - 0 1 0 1
% Z - 0 1 1 0
% V - 0 1 1 1
% R - 1 0 0 0

% 4 * 304 = 1216 bits, gastamos 4.0 bps (bits por simbolo)
NumBits = 4 * 304;
BPS = 4.0;
fprintf("Numero de Bits: 4*304 = %d \nBits por simbolo: %d\n", NumBits, BPS);

%% ex04 - Considere, agora, um outro código binário onde: 
%   i) os símbolos são ordenados por ordem decrescente da sua frequência de ocorrência; 
%   ii) o símbolo de índice 𝑘 é composto por 𝑘 bits todos iguais a 1, exceto o último que é sempre 0.

% Desenvolva a função NumBits = NumeroBits(Texto) que, podendo fazer usos das funções desenvolvidas anteriormente, determina o número de bits necessário 
% para representar a mensagem de texto contida no argumento Texto. Teste-a com o texto contido em Mensagem. 

% outra maneira (ordenados por ordem decrescente da freq de ocorrencia) :

% Q - 0                                 (40.1316 %)
% S - 1 0                              (13.4868 %)
% W - 1 1 0                          (12.8289 %)
% Z - 1 1 1 0                          (8.8816 %)
% D - 1 1 1 1 0                       (8.2237 %)
% C - 1 1 1 1 1 0                    (6.2500 %)
% X - 1 1 1 1 1 1 0                 (5.2632 %)
% V - 1 1 1 1 1 1 1 0              (4.6053 %)
% R - 1 1 1 1 1 1 1 1 0           (0.3289 %)

fprintf("\nexercício 4)\n");
NumBits = NumeroBits(Mensagem);  % dá 901 bits, mais eficaz q o dos exercicios anteriores
                                                         % 901/304 = 2.96 bps (maneira anterior do ex03 dava 4.0 bps)
BPS = NumBits/length(Mensagem);
fprintf("Numero de Bits: %d \nBits por simbolo: %.2f\n", NumBits, BPS);
                                                         
%% ex06 - Desenvolva a função:
%                                                       H = Entropia(Texto)
% que calcula a entropia (em bits por símbolo) associada ao texto contido na variável Texto (tendo por base a estatística dada por esse mesmo texto). 
% Esta função poderá fazer usode funções desenvolvidas anteriormente. Calcule a entropia do texto contido em Mensagem. 

fprintf("\nexercicio 6)\n");
H = Entropia(Mensagem);
fprintf("Entropia (em bits por simbolo): %.2f\n", H);


%% ex07 - Desenvolva um novo código (não ambíguo e instantâneo) que seja mais eficiente que os
% esquemas de codificação vistos anteriormente, e determine o número de bits que seria
% necessário considerar para representar o texto de Mensagem. Compare o número
% médio de bits por símbolo (requerido por esse código) com o valor da entropia de Mensagem 

%                               Vezes que aparece
% Q - 0                                 122                       
% S - 0 1                               41
% W - 1 0                              39
% Z - 1 1                               27              Nº bits = 122* 1 + 41*2 + 39*2 + 27*2
% D - 1 0 1                            25                           + 25*3 + 19*3 + 16*5 + 14*5
% C - 1 1 1                            19                           + 1*7 = 625 bits
% X - 1 0 1 1 1                      16
% U - 1 1 1 0 1                     14
% R - 1 0 1 0 1 0 1                 1

% 625 bits, logo BPS=625/304=2.056 bps

fprintf("\nexercicio 7)\n");
fprintf("Numero de Bits: 625\nBits por simbolo: 2.056 bps\n");

