%Lab1_1

% Очистка робочої пам'яті і закриття графічних вікон
clear; 
close all;

%1 Визначення параметрів
s = 4;
A = 256;
N = 200;
i = 1:N;

% Обчислення гауссівського розподілу
r = 0.1*(i-N/2);
f = exp(-r.^2/2/s^2);
M = A * (f'*f);

% Створення графічного вікна
figure("Name","Task1","Position",[100,100,900,600]);

%1.1 Індексоване зображення, палітра Jet
subplot(2,3,1);
image(M);
axis('square');
title('Палітра Jet');

%1.2 Матриця у зобр. відтінках сірого через subimage
subplot(2,3,2);
subimage(uint8(M));
title('Відтінки сірого(subimage)');

%1.3 Матриця у зобр. відтінках сірого через imshow
subplot(2,3,3);
imshow(uint8(M));
title('Відтінки сірого(imshow)');

%1.4 Матриця у зобр. відтінках сірого через ind2gray палітри hsv
subplot(2,3,4);
imshow(ind2gray(uint8(M),hsv));
title('Відтінки сірого, палітра hsv');

%1.5 Матриця у чорно-біле зобр. через im2bw палітри hot
subplot(2,3,5);
imshow(im2bw(uint8(M),hot));
title('Чорно-біле, палітра hot');

%1.6 Кольорове RGB зобр. матриці
subplot(2,3,6);
Mr = M;
Mg = 256 - M;
Mb = 2^8 * cos(2*pi*log(M)).^2;
imshow(uint8(cat(3,Mr,Mg,Mb)));
title('RGB');




