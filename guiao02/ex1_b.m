%% alinea b)

Ta = 0.01;
t = [0 : Ta: 5];
a = 1;                   % amplitude
f= 10;                   % frequencia
y = sin(2*f*pi*t+pi/2);
plot(t,y);
xlabel('Time(s)');
ylabel('y(t)');
title('Signal: y(t)');
grid;

valorMaxY = a
freqY = f
periodoY = 1/freq
