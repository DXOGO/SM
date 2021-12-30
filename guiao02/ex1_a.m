%% alinea a) 

Ta = 0.01;
t = [0 : Ta: 5];
a = 2;              % amplitude
f = 2;              % frequencia
x = 2*sin(2*f*pi*t);
plot(t,x);
xlabel('Time(s)');
ylabel('x(t)');
title('Signal: x(t)');
grid;

valorMaxX = a
freqX = f
periodoX = 1/freqX