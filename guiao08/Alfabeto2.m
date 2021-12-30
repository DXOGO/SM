function [Simbolos,Frequencias] = Alfabeto2(Texto)

N= length(Texto);       % nº de caracteres em Texto (neste caso sao 304 ! IMPORTANTE PARA VER FREQUENCIA DE CADA SIMBOLO ! )
n=1;

Simbolos(n) = Texto(1);                                                        % assumimos q o 1º simbolo equivale ao 1º carater do Texto
Frequencias(n,1) = sum( Texto == Simbolos(n) )/N * 100;    % calcula em % a frquencia de ocorrer o 1º símbolo (criamos o vetor q vai guardar a frequencia para cada simbolo unico)
%                            |____________________________|
%                                                   |________________________/> sum( Texto == Simbolos(n) ) soma '1' sempre que o simbolo atual apareça em Texto, logo, o resultado desta operação é o 
%                                                                                           número total de um certo caracter entre os 304 da ''Mensagem'
    for k=2 : N
        if sum( Simbolos == Texto(k)) == 0       % se Simbolos == Texto(k) entao retorna 1, caso dê 0 significa que aquela letra ainda não está em Simbolos                                                       % sendo assim ,se nao existe entao adiciona (simbolos vai ser um vetor com simbolos diferentes ('Q', 'W', 'S', etc) e verifica se
            n = n+1;                                             % o valor atual de Texto(k) existe já ou não, caso não ent adiciona-se o novo carácter em 'Simbolos'
            
            Simbolos(n) = Texto(k);                                                           % atualiza vetor de Simbolos sempre que há uma letra diferente
            Frequencias(n,1) = sum( Texto == Simbolos(n) )/N*100;        % atualizar vetor de Frequencias para cada simbolo
        end
    end
end

