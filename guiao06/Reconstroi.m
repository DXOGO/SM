% a função Reconstroi que efetua a operação inversa da função 'Espetro' 
    % → recebendo o vetor 𝐗 da representação em Fourier, reconstrói a sequência de amostras 
    % do sinal no domínio do tempo, 𝐱, visualizando, depois, o sinal reconstruído)

function[x,t]= Reconstroi (X,f)     % recebe X e f
     
    N = length(X);
    fa = -f(1)*2;
    X = ifftshift(X);
    
    x = real(ifft(X) * N);
 
    fa = f(end)*2;
    Ta = 1/fa;
   
    t = [0: Ta: (N-1)*Ta]';
    plot(t, x);
    xlabel("Time (s)")
    ylabel("Magnitude")
end
