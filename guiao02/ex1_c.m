%% alinea c)

Ta = 0.01;
t = [0 : Ta: 5];
z = sin(6*pi*t)+sin(8*pi*t);
plot(t,z);
xlabel('Time(s)');
ylabel('z(t)');
title('Signal: z(t)');
grid;

% pelo grafico vemos que periodo=1, logo, como f = 1/periodo:

freq = 1
periodo = 1/freq
valorMaxZ = 1.950870411857320      % (>> max(z) na consola)