function [x,t] = GeraSinal(N,Ta)
   
    t = [0 : (N-1)]'*Ta;
    
    rn1 = random('normal',0,pi,N,1);        
    rn2 = random('normal',0,pi,N,1);        % criar 2 ruidos
    
    phi1 = zeros(N,1);                      % craimos phi1 e phi2
    phi2 = zeros(N,1);                      % espaço de amostras para rn1 e rn2 (criar espaço de memoria)
    
    for k=2 : N
        phi1(k) = phi1(k-1) + (rn1(k) + rn1(k-1))*Ta/2;      % phi = w e rn = x
        phi2(k) = phi2(k-1) + (rn2(k) + rn2(k-1))*Ta/2;      % w(k) = w(k-1) + ((x(k)+x(k-1))* Ta/2      
    end                                                                            % formula recursiva
      
    r = 0.5 *sin(20*pi*t+10*phi1) + 0.5*sin(24*pi*t+10*phi2);
    x = sin(2*pi*t) + r;                              % dados do enunciado (funções r(t) e x(t))
    
    figure(11);
    plot(t,x);
    xlabel('t');
    ylabel('x');
    grid on;
    
end

