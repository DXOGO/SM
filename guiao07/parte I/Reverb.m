function y = Reverb(x,fa,Delay,Gain)

    N = length(x);      % dimensao de x 
    y = zeros(N,1);     % criar y com a mesma dimensao de x
    Ta=1/fa;
    D = round(Delay/Ta);    % transformar o delay num numero inteiro de amostras
    
    for n=1 : N     % percorre todas as amostras de y e guarda o valor em cada uma
        y(n) = x(n) + Gain*y(max([1 n-D]));         % amostra atual de saida = amostra atual entrada + ( ganho * y atrasado )   (max usado para o menor numero ser sempre 1)
                                                                       % formula semelhante a do guiao
    end
    
    Px = x'*x/N;         % potencia do sinal x
    Py = y'*y/N;         % potencia do sinal y
    y = y*sqrt(Px/Py); % isto +e preciso dps das funções neste tipo de exercício para nomralizar os sons;

end
