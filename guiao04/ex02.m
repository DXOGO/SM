% fft(X)  -->  If X is a vector, then fft(X) returns the Fourier transform of the vector
clear all;
clc;
%figure(1);
%% alinea a) 𝑥(𝑡) = sin(2𝜋𝑡), registado durante 10 períodos.

T = 1;                   % periodo
Ta =  0.01;              % tempo de amostragem
t = [0 : Ta : 10-Ta]'; 

x = sin(2*pi*t);

%subplot(2,2,1);
[X,fx] = Espetro(x,Ta,0,21);        % w==0 por isso n há windowing

%% alinea b) 𝑦(𝑡) = sin(10𝜋𝑡) + cos(12𝜋𝑡) + cos(14𝜋𝑡 − 𝜋/4), registado durante 5 seg.

Ta = 0.01;
t = [0 : Ta : 5-Ta]';

y = sin(10*pi*t) + cos(12*pi*t) + cos(14*pi*t - pi/4);

%subplot(2,2,2);
[Y,fy] = Espetro(y,Ta,0,22);

%% alinea c)  𝑧(𝑡) – onda quadrada entre 0 e 1, de frequência 1 Hz, registada durante 5 seg.

Ta = 0.01;
t = [0 : Ta : 5-Ta];

z = zeros(length(t));

z(1 : length(z)/2) = 1;

[Z,fz] = Espetro(z,Ta,0,23);


%% alinea d)  𝑞(𝑡) - onda triangular entre -1 e 1, de frequência 1 Hz, registada durante 5 seg.

Ta =  0.01;
t1 = [0 : Ta : (0.25-Ta)]';
t2 = [0.25 : Ta : (0.75-Ta)]';
t3 = [0.75 : Ta : (1-Ta)]';

x1 = (1/0.25)*t1;

b = 0.5/0.25;
x2 = -(1/0.25)*t2 + b;

c = -1/0.25;
x3 = (1/0.25)*t3 + c;

xp = [x1;x2;x3];
tp = [t1;t2;t3];

q = [xp ; xp ; xp ; xp ; xp];
t = [0 : Ta : (5-Ta)]';

%subplot(2,2,4);
[Q,fq] = Espetro(q,Ta,0,24);


