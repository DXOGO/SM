% 3 funçoes diferentes mas fazem todos o mesmo

%function [NumBits, NumBPS] = GeraMensagem(f,CompMesg,nBits)
    
%   f=f/100;                             % meter em percentagem (caso metas f ja em percentagem no vetor elimina este passo)
%   NumBits=0;
                                                % nBits vai ser [ 2 1 4 3 4 ] e f = [ 14 64 5 10 7 ]
%   for n = 1 : CompMesg                                                                                                                     %     | 0.14 |                                              1       
%       q = rand();                                                                                                                                  %    |  0.78 |                                              1       
%       i = sum(q > cumsum(f)) + 1;                                                                                                      %     | 0.83 | ---> cumsum(f), ex: q=0.81   0                                                                                       
%       NumBits = NumBits + nBits(i);                                                                                                    %     |  0.93 |             (q>cumsum(f))--->    0
%   end                                                                                                                                                 %     |  1.00 |                                             0
   
%   NumBPS = NumBits/CompMesg;
   
%end

function [NumBits, NumBPS] = GeraMensagem(f,CompMesg,nBits)
    
  pd = makedist('Multinomial', 'probabilities', f/sum(f));       % cria uma distribuiçao de probabilidade (multinomial p serem smp numeros inteiros)
  Mesg = random(pd, CompMesg, 1);                                 % funçao random p gerar vetor de elementos do tamanho de compMesg 
  NumBits=0;          % contador
    
  for k = 1 : length(f)       % ciclo for para os simbolos do alfabeto            tanto k e simbolos tem valores iguais de 1,2,3,4,5
      NumBits = NumBits + sum(Mesg==k)*nBits(k);          % nº de vezes q cada simbolo ocorreu na msg e multipliar cada numero pelo numero de simbolos q ocupa
  end
    
   NumBPS = NumBits/CompMesg;      % nº medio de bits por simbolo
    
end

%function [NumBits, NumBPS] = GeraMensagem(f,CompMesg,nBits)

% da funçao anterior podemos compactar mais a juntar pd e Mesg
%Mesg = randsample( 1 : length(f), CompMesg, true, f/sum(f));           % gerar aleatoriamente numeros de 1 a 5 de acordo ( n percebi o resto...)
% compactar o loop for 
%NumBits= sum(nBits(Mesg));
%NumBPS = NumBits/CompMesg;      % nº medio de bits por simbolo

%end