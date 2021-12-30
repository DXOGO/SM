%% alinea d)

Ta = 0.01;
t = [0 : Ta: 5];
w = sin(6*pi*t)+sin(8*pi*t+0.1);
plot(t,w);
xlabel('Time(s)');
ylabel('w(t)');
title('Signal: w(t)');
grid;

% pelo grafico vemos que periodo=1, logo, como f = 1/periodo:

freq = 1
periodo = 1/freq
valorMaxZ = 1.927256150252310   % (>> max(w) na consola)