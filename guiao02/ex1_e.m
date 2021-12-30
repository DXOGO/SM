%% alinea e)

Ta = 0.001;
t = [0 : Ta: 4];
q = sin(6*pi*t)+sin(7*pi*t)+sin(8*pi*t);
plot(t,q);
xlabel('Time(s)');
ylabel('q(t)');
title('Signal: q(t)');
grid;

% pelo grafico vemos que periodo=2, logo, como f = 1/periodo:

freq = 1/2
periodo = 2
valorMaxZ = max(q);