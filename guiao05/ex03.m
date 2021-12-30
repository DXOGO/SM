% Implemente um script que lhe permita subamostrar uma imagem, considerando apenas um pixel a cada 2 da imagem, 
% e depois a cada 4, a cada 8 e a cada 16. Visualize cada uma das imagens subamostradas, verificando 
% o aparecimento do fenómeno de aliasing.

img = imread('Parede.jpg');
figure(1);
subplot(2,2,1);
image(img);
whos Image

delta = 2;
img4 = img(1 : delta : end, 1 : delta : end, :);
subplot(2,2,2);
image(img4);

delta = 8;
img8 = img(1 : delta : end, 1 : delta : end, :);
subplot(2,2,3);
image(img8);

delta = 16;
img16 = img(1 : delta : end, 1 : delta : end, :);
subplot(2,2,4);
image(img16);

