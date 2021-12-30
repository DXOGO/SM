clear;
close all;
clc;

Ta = 0.01;
f0 = 1;
T0 = 1/f0;
Np = 10;
t = [0:Ta: (Np*T0-Ta)]';
x = sin(2*pi*f0*t);
[X, fx] = Espetro(x, Ta, 0, 21); 

[x,Ta] = Reconstroi(X, fx,51); 