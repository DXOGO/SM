clear all
clc
%% ex01) O processamento de sinais, como de imagens, pode também ser realizado diretamente
% no domínio do tempo, ou dos pixéis no caso de imagens. Um exemplo é o processo de
% suavização de imagens baseados na média das cores dos pixéis vizinhos.
% Implemente a função 𝑭𝒊𝒍𝒕𝒓𝒂𝑰𝒎𝒂𝒈𝒆𝒎_𝑴𝒆𝒅𝒊𝒂(𝐼𝑚𝑎𝑔𝑒𝑚, 𝑁𝑝) que, recebendo a representação matricial
% de uma imagem (na variável 𝐼𝑚𝑎𝑔𝑒𝑚), determina e visualiza uma nova imagem cuja cor
% de cada pixel é determinada pela média das cores dos pixéis do quadrado de 𝑁𝑝 × 𝑁𝑝
% pixéis centrado nesse pixel (𝑁𝑝 é um número inteiro ímpar).

X = imread("Garca.jpg");
Y = FiltraImagem_Media(X, 5);
imshow(X);  %mostra original
figure(2);  
imshow(Y);  % mostra imagem resultante da função

% deixa a imagem mais "suave"