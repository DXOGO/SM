% Desenvolva a função P05_t1 que, recebendo o vetor de amostras de um sinal 𝐱, e o período de amostragem, 𝑇𝑎
% considerado nesse processo de amostragem, produz o gráfico do sinal temporal que dera origem às amostras.

function [y,yTa] = P05_t1(x,Ta)
% x ..... sinal a reconstruir
% Ta .... período de amostragem do sinal x
% y ..... sinal reconstruido
% yTa ... período de amostragem do sinal reconstruido (100 vezes menor que Ta)
% o factor de 100 está "hardwired" no código
%
% usando a documentaçao do Matlab (https://www.mathworks.com/help/signal/ref/sinc.html), bastaria fazer
%
%  x = x(:); vector coluna
%  tX = 1:length(x) % desde 1 até length(x), em tempos normalizados
%  tY = (-400:100*length(x)+500)/100; % desde -4 até length(x)+5, em tempos normalizados
%  [t1,t2] = ndgrid(tY,tX);
%  y = sinc(t1-t2)*x;
%  plot(tX,x,'o',tY,y,'-');
%
% a solução que apresento em baixo tem mais linhas mas ilustra melhor o que está a ser feito
%

% fator de "oversampling"
oversampling = 100;

% instantes de tempo das amostras de x
xT = (0:length(x)-1)*Ta;

% cálculo de yTa (período de amostragem de y)
yTa = Ta/oversampling;

% instantes de tempo das amostras de y (tempos considerando 5 amostras extras de x de cada lado)
yT = (-5*oversampling:oversampling*(length(x)+4))*yTa;

% inicialização do sinal de saída
y = zeros(1,length(yT));

% adição da contribuição de cada amostra de x no sinal y; cada amostra vem multiplicada pela funcão sinc centrada nessa amostra
for ix=1:length(x)
  y = y+x(ix)*sinc((yT-xT(ix))/Ta);
end

% mostrar resultado quando não se usam os argumentos de saída desta função
if nargout == 0
  figure; % nova figura
  plot(yT,y,'b',xT,x,'o');
  xlabel('time');
  ylabel('amplitude');
  title('Reconstrução do sinal x entre as suas amostras conhecidas');
  legend('x','reconstrução');
  zoom on;
  grid on;
end
