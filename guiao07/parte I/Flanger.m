function y = Flanger(x,fa, MaxDelay, Freq)
%                                              |______|____ maior atraso q pode ter (MaxDelay) e a sua frequenci a (Freq)
    N = length(x); %criamos N com a dimensao de x
    y = zeros(N,1); % criamos vetor y (de zeros) com a dimensao de x 
    
    for n=1 : N     % loop q percorre todas as amostras
        
        dn = round(( MaxDelay / 2*cos(2*pi*Freq*(n-1)/fa ) - MaxDelay/2)*fa );       % valor do atraso correspondente a uma amostra
%                                                |______________________|   |___________|-----> valor medio entre maxDelay e 0 (eixo y) (subtrai para ficar entre 0 e -MaxDelay)
%                                                                 |
%                       cos(2*pi*r*t) onde t = n*Ta ( =n/fa ), fazemos n-1 para começar em 0           

        y(n) = x(max([1 n+dn]));  % y = amostra atrasada do x NO MOMENTO (max pois os primeiros valores de n+dn vao ser negativos, assim, fica smp 1 no minimo)        
    end

    Px = x'*x/N;    
    Py = y'*y/N;  
    y= y*sqrt(Px/Py);   % normalização da potencia do som
    
end

