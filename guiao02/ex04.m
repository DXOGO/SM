N = 3;
f = [3000 3000/1.1 3000/1.2];           % matriz com f1,f2,f3
T = (1/f(1))*(1/10)*lcm(lcm(10,11),12); % período da sinusoide composta   (lcm -> Least common multiple)
Ta = 0.000001;                          % tempo de amostragem muito reduzido
t = [0: Ta : 2*T];                         
amplitudeMax = zeros(1,3);              % matriz vazia para as amplitudes máximas
potencias = zeros(1,3);                 % matriz vazia para as potências

for n = 1 : N
    fase = (rand(1,3) .* 2*pi) - pi;    % criar matriz 1x3 aleatória, multiplicar para ficar [0:2pi] 
                                        % e subtrair pi para ficar [-pi:pi]    
    r = sin(2*pi*f(1)*t + fase(1)) + sin(2*pi*f(2)*t + fase(2)) + sin(2*pi*f(3)*t + fase(3));
    plot(t,r);
    xlabel("Tempo (s)");
    ylabel("Amplitude");  
    amplitudeMax(n) = max(r);
    potencias(n) = Power(r,t);
    hold on 
end

hold off                             %acabar com a sobreposição uma vez que já aparecem todos os gráficos juntos
disp("amplitudes max: ");
disp(amplitudeMax);
disp("potencias: ");
disp(potencias);

function p = Power(x,t)
    p = sum(x .^ 2) / length(t);
end