% 𝐗 – vetor da mesma dimensão de 𝐱, com os coeficientes da DFT de 𝑥(𝑡)
% 𝑓 – vetor da mesma dimensão de 𝐱, com as frequências (em Hz) de cada componente de 𝐗

% Espetro retorna e apresenta o espetro (amplitude apenas) de um sinal (passado através do seu vetor de amostras, 𝐱) 
% Amostra com período de amostragem 𝑇𝑎. O gráfico do espetro deve apresentar no eixo das abcissas a 
% frequência em Hz, desde −𝑓𝑎/2 a +𝑓𝑎/2, onde 𝑓𝑎 = 1/𝑇𝑎.

function [X,f] = Espetro(x,Ta,w,fig)    % devolve X e f
    
    N = length(x);
    T0 = N*Ta;
    
    if w==0
        X = fftshift(fft(x))/N;
    else 
        X = fftshift(fft(x.*blackman(N)))/N;
    end
    
    f0 = 1/T0;
    f = [0 : (N-1)]'*f0 - (N/2)*f0; 
    
    % criar grafico
    figure(fig);
    plot(f, abs(X));
    xlabel("Freq(Hz)");
    ylabel("|X(f)|");
    grid;
    
end

