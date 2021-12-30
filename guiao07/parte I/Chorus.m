function y = Chorus(x,fa,MaxDelay,NumComp)

    N = length(x);      % ver dimensao do vetor 'x'
    y = zeros(N,1);     % criar vetor 'y' q é o vetor que começa c zeros e dimensao = 'x' e depois criar replicas sucessivas do sinal  x e guarda em 'y'
    Ta=1/fa;              % periodo de amostragem
    
    for n=1 : NumComp           % loop para o numero de replicas especificadas
        
        CurDelay = random('uniform',0,MaxDelay,1,1);    % determinar aleatoriamente o atraso da replica q ta a ser criada no momento -> determina o valor do atraso atraves da funçao random
         %retorna em segundos                                      % '0, MaxDelay' → intervalo q pode estar o delay        ' 1, 1' → resultado da função random é um vetor 1x1 (1 valor)
                                                                                   
 %                              ___________________________
 %                             |                                         |
 %                             |                                         |
 %                             |                                         |
 %          --------------------                                         ------------------>CurlDelay
 %                             0                                   MaxDelay
 %                              <-------------------------------------->
 %                       Delay SÓ pode estar entre estes 2 valores
           
         dn = max([1 round( CurDelay / Ta )]);                 % transforma o valor do atraso (em s) ao valor de amostras correspondente ao dividir o  valor do atraso pelo periodo de amostragem 
         % dn → nº de amostras                                       % fica o nº de amostras q corresponde a  esse atraso (round para arredondar a nº inteiro pq amostras só podem ser numeros inteiros
                                                                                    % e max[ 1 /*...*/] vai buscar o maior balor entre 1 e o CurlDelay, logo, se CurlDelay der ~0 entao o dn=1 assim garantimos q anda sempre no minimo 1 amostra
        
          y(dn : end) = y(dn : end) + x(1: end-dn+1);       % aqui é onde ocorre o atraso →  replica atrasada do sinal (mesma duraçao e mesmo numero de amostras mas com atraso)
    end                                                                           % novo y = y anterior + replica atrasada
    
    Px = (x' * x )/N;    % potencia do sinal x                                                                                                               
    Py = ( y' * y)/N;    % potencia do sinal y                                                                                                                                 
    y= y*sqrt(Px/Py);                                                                                                                                                 
    
end
