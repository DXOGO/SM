function Simbolos = Alfabeto1(Texto)
    
N= length(Texto);      % nº de caracteres em Texto 
n=1;
Simbolos(n) = Texto(1);     % assumimos q o 1º simbolo equivale ao 1º carater da mensagem
    
    for k=2 : N
        if sum( Simbolos == Texto(k) ) == 0      % se Simbolos == Texto(k) entao retorna 1, caso dê 0 significa que aquela letra ainda não está em Simbolos
                                                                       % sendo assim ,se nao existe entao adiciona (simbolos vai ser um vetor com simbolos diferentes ('Q', 'W', 'S', etc) e verifica se
            n = n+1;                                            % o valor atual de Texto(k) existe já ou não, caso não ent adiciona-se o novo carácter em 'Simbolos'
            
            Simbolos(n) = Texto(k);                     % atualiza vetor de Simbolos sempre que há uma letra diferente
        end
    end
    % tmb se pode usar a função 'unique'
end