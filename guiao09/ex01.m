clear all
clc
%% ex01 - Codificação Eficiente de Informação
% O alfabeto de um esquema de codificação apresenta o seguinte histograma típico de ocorrência dos seus símbolos

%               Simbolo                 Prob de Ocorrência (%)
%                   A                                   14
%                   B                                   64
%                   C                                   5
%                   D                                   10
%                   E                                   7

%% alinea a) Determine a entropia da informação codificada com esse alfabeto             entropia - bits por segundo (bps)

% Entropia : H= somatorio(k=1 a K)* pk*log2(1/pk) onde pk é a prob de acontecer

pk = [ 0.14 0.64 0.05 0.10 0.07 ];       % probabilidades        pk = [ 14 64 5 10 7 ] / 100
% H=pk'*log2(1./pk) caso em cima passarmos p para p'
H = sum(pk.*log2(1./pk));                     % formula
fprintf("alinea a) Entropia: %.2f bps\n\n", H);


%% alinea b) Usando o código de Huffman, atribua um código binário a cada símbolo deste alfabeto

% O código de Huffman é o resultado de um algoritmo que define a forma de construção da respetiva árvore binária, e cuja eficiência de codificação é elevada.

% Este código considera a lista de símbolos presentes numa mensagem e o respetivo número de ocorrências nessa mensagem

%    A         14               Começamos por retirar os 2 símbolos de menor frequencia (neste caso C e E)                    
%    B         64                tiramos SEMPRE os 2 menos provaveis (!!!!!!!!), tanto podem ser 2 simbolos, como um simbolo e um simbolo criado(*)                                                                                                                                            
%    C          5                 O mais pequeno fica do lado esquerdo !!!!!!! Descobre-se dps o binario a ler de cima p baixo !!!!!  
%    D         10
%    E          7

%                      *,100              (-> tem de ser sempre 100%)                               % IMPLEMENTAÇAO DO CODIGO DE HUFFMAN
%                      0/     \1
%                   *,36   B,64                                                                                                                         A - 00
%                  0/    \1                                                                                                                                 B - 1      
%             A,14   *,22                                                                                                                                C - 0110
%                       0/    \1                                                                                                                             D - 010
%                  D,10   *,12                                                                                                                            E - 0111
%                            0/    \1
%                          C,5    E,7       (maior numero tem ramo c valor 1 e o outro 0)


%% OUTRO EXEMPLO COM PROBABILIDADES DIFERENTES

%    A         12               Começamos por retirar os 2 símbolos de menor frequencia (neste caso C e E)                    
%    B         63                tiramos SEMPRE os 2 menos provaveis (!!!!!!!!), tanto podem ser 2 simbolos, como um simbolo e um simbolo criado(*)                                                                                                                                      
%    C          7                 Se houver 2 valores mais pequenos que o valor atual de (*) ent fazemos de lado os dois (exemplo abaixo)                                                                                                                                           
%    D         10
%    E          8

%           % IMPLEMENTAÇAO DO CODIGO DE HUFFMAN
%                     
%                                              *,100                                      A - 011
%                                            0/       \1                                   B - 1      
%                                    __ *,37__      B,63                             C - 000
%                                 0/              \1                                      D - 010
%                             *,15               *,22                                  E - 001
%                            0/    \1           0/     \1     
%                          C,7    E,8    D,10      A,12



%% alinea c)  Qual seria o número médio de bits por símbolo que esperaria obter numa mensagem composta por 1000 símbolos deste alfabeto?

%               Simbolo                 Prob de Ocorrência (%)          Representação por bits
%                   A                                   14                                               00
%                   B                                   64                                                1
%                   C                                   5                                               0110
%                   D                                   10                                              010
%                   E                                   7                                               0111            

nBits = [ 2 1 4 3 4 ];   % vetor q guarda quantos bits cada simbolo usa
pk = [ 0.14 0.64 0.05 0.10 0.07 ];   % prob de cada simbolo
probC = sum(pk.*nBits);
disp("alinea c) Número médio de bps (bits por símbolo) em 1000 símbolos: " + probC)
