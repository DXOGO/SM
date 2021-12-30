function NumBits = NumeroBits(Texto)
     
    [Simbolos, Frequencias] = Alfabeto2(Texto);         % chamar a função Alfabeto2  
    fprintf("Simbolos originais (por ordem de posição em 'Mensagem'):      %s\n", Simbolos );
    
    [~, i] = sort(Frequencias, 'descend');                    % sort por ordem decrescente  [Frequencias, i] = sort(Frequencias, 'descend'); 
    Simbolos = Simbolos(i);     % Simbolos
    fprintf("Simbolos ordenados (por ordem descrescente de frequência): %s\n\n", Simbolos );
    
    NumBits = 0;        % somador
    %N= length(Texto);  length da Mensagem toda, ou seja, os 304 caracteres 
    N= length(Simbolos); %length dos simbolos unicos (são 9)
    
    for k=1 : N     % loop para o num de bits de CADA SIMBOLO e faz a soma de todos
        NumBits = NumBits + sum(Texto ==Simbolos(k)) * k;
%                                        |______________________________|
%                                                                       |________________/>  sum( Texto == Simbolos(k) ) soma '1' sempre que o simbolo atual apareça em Texto, logo, o resultado desta operação é o 
%                                                                                                     número total de um certo caracter entre os 304 da ''Mensagem', e depois multiplica o numero de vezes que aparece em
%                                                                                                     em 'Mensagem' e multiplica por k (k representa a posição do caracter em Simbolos) para dar o NumBits para aquele caracter
    end

end