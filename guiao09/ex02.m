clear all
clc
%% ex02 - Desenvolva, agora, a função:
%                                                                       [NumBits,NumBPS] = GeraMensagem(f,CompMesg,nBits)

% -> gera uma mensagem aleatória, com um número total de símbolos dado por 𝐶𝑜𝑚𝑝𝑀𝑒𝑠𝑔, usando um alfabeto de símbolos cuja frequência de ocorrência é
% especificada (em percentagem) no vetor 𝑓, de dimensão 𝑁 × 1. Na geração da mensagem, a probabilidade com que ocorre cada símbolo deve seguir o valor
% especificado em 𝑓. A função recebe ainda o vetor 𝑛𝐵𝑖𝑡𝑠, também de dimensão 𝑁 × 1, em que cada elemento indica o número de bits com que é codificado
% o símbolo correspondente. 

% A função retorna, em 𝑁𝑢𝑚𝐵𝑖𝑡𝑠, o número total de bits que a mensagem gerada aleatoriamente requer para ser representada, e  retorna também, 
% em 𝑁𝑢𝑚𝐵𝑃𝑆, o número médio de bits por símbolo verificado na mensagem gerada. Teste esta função usando o alfabeto da questão anterior

% alfabeto anterior
%               Simbolo                 Prob de Ocorrência (%)           Representação por bits          Método mais eficaz (ex03 ganha-se 1 bit)
%                   A                                   14                                               00                                         000
%                   B                                   64                                                1                                            1
%                   C                                   5                                               0110                                       001
%                   D                                   10                                             010                                         010
%                   E                                   7                                               0111                                        011          

f = [ 14 64 5 10 7 ];           % prob de ocorrencia de cada simbolo
CompMesg = 1000000;      % comprimento da msg
%nBits = [ 2 1 4 3 4 ];          % nº de bits por cada simbolo
nBits = [ 3 1 3 3 3 ];              % mais eficaz  (ex03)
[NumBits, NumBPS] = GeraMensagem(f,CompMesg,nBits)          % qualquer funçao q use dá o mesmo valor