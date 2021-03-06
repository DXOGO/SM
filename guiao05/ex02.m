%% alinea a) ๐ฅ(๐ก)=sin(2๐๐ก), amostrado com ๐๐ = 0.2 seg, observado durante 5 segundos

Ta = 0.2;
t = [0 : Ta : (5-Ta)];
x = sin(2*pi*t);
P05_t1(x,Ta);
figure(101);
%ReconstroiSinal(x,Ta);

%% alinea b) ๐ฆ(๐ก)=sin(10๐๐ก)+cos(12๐๐ก)+cos(14๐๐กโ๐/4), registado durante 5 seg, com ๐๐ = 0.04 segundos

Ta = 0.04;
t = [0 : Ta : (5-Ta)];
y = sin(10*pi*t)+cos(12*pi*t)+cos(14*pi-pi/4);
%P05_t1(y,Ta);
figure(102);
%ReconstroiSinal(y,Ta);

%% alinea c) ๐ง(๐ก)=๐ ๐๐๐(5๐ก), registado no intervalo [โ5; +5[ segundos com ๐๐ = 0.1 seg.

Ta = 0.1;
t = [-5 : Ta : (5-Ta)];
z = sinc(5*t);
%P05_t1(z,Ta);
figure(103);
%ReconstroiSinal(z,Ta);