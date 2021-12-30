%% alinea a) 𝑥(𝑡)=sin(2𝜋𝑡), amostrado com 𝑇𝑎 = 0.2 seg, observado durante 5 segundos

Ta = 0.2;
t = [0 : Ta : (5-Ta)];
x = sin(2*pi*t);
P05_t1(x,Ta);
figure(101);
%ReconstroiSinal(x,Ta);

%% alinea b) 𝑦(𝑡)=sin(10𝜋𝑡)+cos(12𝜋𝑡)+cos(14𝜋𝑡−𝜋/4), registado durante 5 seg, com 𝑇𝑎 = 0.04 segundos

Ta = 0.04;
t = [0 : Ta : (5-Ta)];
y = sin(10*pi*t)+cos(12*pi*t)+cos(14*pi-pi/4);
%P05_t1(y,Ta);
figure(102);
%ReconstroiSinal(y,Ta);

%% alinea c) 𝑧(𝑡)=𝑠𝑖𝑛𝑐(5𝑡), registado no intervalo [−5; +5[ segundos com 𝑇𝑎 = 0.1 seg.

Ta = 0.1;
t = [-5 : Ta : (5-Ta)];
z = sinc(5*t);
%P05_t1(z,Ta);
figure(103);
%ReconstroiSinal(z,Ta);