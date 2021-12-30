clear all;
close all;
clc;

%% Teste a função da alínea anterior para criar o espetro de um sinal composto por:
% 500 amostras;
% período de amostragem igual a 1 ms;
% o somatório de 20 sinais sinusoidais, cada um de amplitude unitária, cujas
% frequências são determinadas aleatoriamente entre 1 e 20 Hz 
% a fase de cada sinusoide é também determinada aleatoriamente

N = 500;                                     % nº de amostras
Ta = 0.001;                                  % periodo de amostragem de 1ms
Ns = 20;                                     % nº de sinais sinusodais
f = random('uniform', 1,20,Ns,1);            % 20 freq aleatorias de 1 a 20 hz
Phase = random('uniform', -pi, pi, Ns, 1);   % 20 fases aleatorias (entre pi e -pi)
t = [0: (N-1)]'*Ta;
x = zeros(N,1);

for n = 1:Ns 
  x = x + sin(2*pi*f(n)*t + Phase(n));
end

[X, fx] = Espetro(x,Ta,0, 41);