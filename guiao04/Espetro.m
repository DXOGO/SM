% 𝐗 – vetor da mesma dimensão de 𝐱, com os coeficientes da DFT de 𝑥(𝑡)
% 𝑓 – vetor da mesma dimensão de 𝐱, com as frequências (em Hz) de cada componente de 𝐗

function [X,f] = Espetro(x,Ta,w,fig)    
    
    N = length(x);
    
    if w==0
        X = fftshift(fft(x))/N;
    else 
        X = fftshift(fft(x.*blackman(N)))/N;
    end
    
    f0 = 1/(N*Ta);
    f = [0 : N-1]'*f0-(N/2)*f0; 
    figure(fig);
    plot(f, abs(X));
    xlabel("Freq(Hz)");
    ylabel("|X(f)|");
    grid;
end

