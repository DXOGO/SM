% recebendo o vetor de amostras de um sinal,𝐱, e o período de amostragem, 𝑇𝑎, considerado nesse processo de 
% amostragem, produz o gráfico do sinal temporal que dera origem às amostras

function ReconstroiSinal(X,Ta)
    
    N = length(X);
    y = zeros(100*N, 1);        % 100*N linhas e 1 coluna de zeros
    
    fa = 1/Ta;
    fy = 100*fa;        % freq de amostragem    
    Ty = 1/fy;          % tempo de amostragem da freq de amostragem
    
    t = [0 : (length(y)-1)]' * Ty;
    
    for i=1 : N
        y = y + X(i)*sinc(fa*(t-(i-1)*Ta));     % (i-1) pq o 1º valor de i=1 e queremos aqui um 0
    end
    
    plot(t,y, [0:(N-1)]'*Ta,X,'r.');
    xlabel("Tempo(s)");
    ylabel("Sinal");
    grid on;
end

