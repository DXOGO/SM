clear all
clc
%% ex01)

load Guitar03.mat
%sound(x,fa);          % produz o som

%% ex02) Usando a função Espetro (criada na Aula 04), observe o espetro do sinal carregado na pergunta anterior, e analise as notas musicais consideradas neste sinal.

Ta = 1/fa;
x = x - mean(x);                        % Average or mean value of array
[X,f] = Espetro(x,Ta,0,201);
xlim([0 1500]);     % apresentar plot de 0 a 1500

%% ex03) desenvolva um filtro a ser aplicado sobre o espetro (i.e., um filtro que opera no domínio da frequência) que remova o conteúdo espetral desse sinal que se 
% situe abaixo da frequência 100 Hz e acima da frequência 400Hz. Reconstrua o sinal filtrado, 𝐰, e ouça o respetivo som. Repita o teste agora para reter o conteúdo 
% do sinal na gama de frequências de 400 Hz a 600 Hz. E, depois, para a gama de 600 kHz a 1.2 kHz.

fL = 600;   % 100; 400; 600
fH = 1200;  % 400; 600; 1200;

H = zeros(size(f));
H(f>-fH) = 1;
H(f>-fL) = 0;
H(f>fL) = 1;
H(f>fH) = 0;
figure(301);
plot(f,H);
ylim([0 2]);
Xf = H.*X;    
figure(301);
[w,t] = Reconstroi(Xf,X);
w = real(w);        % ignorar parte imaginaria
N = length(x);
Px = x'*x/N;    % pot do sinal x
Pw = w'*w/N;    % pot do sinal w
w= w*sqrt(Px/Pw);
%sound(w,fa);       % vai produzir um som mais agudo


%% ex04) O efeito Chorus produz a sensação de existirem vários instrumentos a tocar ao mesmo tempo, e é gerado por adição de várias réplicas do sinal atrasadas 
%no tempo de uma determinada quantidade aleatória. Implemente a função:
%                                                                           y=Chorus(x,fa,MaxDelay,NumComp)

% que reproduz (e devolve, em y) o sinal constituído pela soma de NumComp réplicas do sinal x atrasadas no tempo de um valor aleatório, uniformemente 
% distribuído entre 0 e MaxDelay (expresso em segundos). Tenha cuidado para que, no final, o sinal reproduzido tenha a mesma potência que o sinal original x

MaxDelay = 0.3;     % som pode estar atrasado de 0 a MaxDelay segundos
NumComp = 5;        % numero de replicas que a função vai adicionar, cda uma com o seu atraso
y = Chorus(x,fa,MaxDelay,NumComp);
%sound(y,fa);
[Y,fy] = Espetro(y,Ta,0,401);
xlim([0 1500]);

%% ex05) O efeito Flanger introduz uma sensação de evolução dinâmica da propagação do som, e é gerado por se adicionar ao sinal uma réplica que vai 
% sendo atrasada de uma quantidade que varia sinusoidalmente ao longo do tempo. Implemente a função:
%                                                                                                       y=Flanger(x,fa,MaxDelay,Freq)

% que reproduz (e devolve, em y) o sinal x ao qual é adicionada uma sua réplica cujas amostras vão sendo atrasadas ao longo do tempo por um atraso 
% que varia sinusoidalmente entre 0 e MaxDelay segundos, com uma frequência de Freq (em Hz). 

MaxDelay =0.02;
Freq = 0.2;
z = Flanger(x,fa,MaxDelay,Freq);
%sound(y,fa);
[Z, fz] = Espetro(z, Ta, 0, 501);

%% ex06 O efeito Reverb reproduz o efeito sonoro quando o instrumento é tocado numa sala com reverberação, e pode ser gerado através de um 
% processo de realimentação. Implemente a função:
%                                                      y=Reverb(x,fa,Delay,Gain)
% que reproduz (e devolve, em y) o sinal x com efeito de Reverb. Note que o ganho Gain deve ser positivo e menor que 1. Tenha cuidado para que, no final, 
% o sinal reproduzido tenha a mesma potência que o sinal original x

Delay = 0.2;
Gain = 0.8;
w = Reverb(x,fa,Delay,Gain);
%sound(y,fa);
[W,fw] = Espetro(w, Ta,0,601);
xlim([0 1500]);


%% ex07 Experimente, agora, reproduzir o mesmo sinal mas especificando uma frequência de amostragem igual a metade da anterior

%sound(fy, fa/2);

