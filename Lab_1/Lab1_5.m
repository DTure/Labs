% Lab1_5

% Очистка робочої пам'яті і закриття графічних вікон
clear; 
close all;

%5 Розмір зображення
N = 200;

% Ініціалізуємо масив Circles нулями
Circles = uint8(zeros(N,N,3));

% Задаємо вектор зсуву для кожного кольору
N0 = [0.1 0.25 0.4] * N;

% Індекс для встановлення розмірів
i = 1:N;

% Цикл для створення кіл
for j = 1:3
    [x, y] = meshgrid(i - N/4-N0(j));
    Circles(:,:,j) = uint8(255*(x.^2+y.^2<=(N/4)^2));
end;

%Зберігання отриманого зображення у форматі tiff
imwrite(Circles, 'Circles.tiff', 'tiff');

% Створення графічного вікна
figure("Name","Task5","Position",[100,100,700,500]);

% Виведення початкового зображення
subplot(2,3,1);
imshow (Circles);
title('Початкове');

%5.1,5.2 Кадрування зображення
crop = imcrop(Circles, [0.1 0.1 0.8 0.8]*N);
subplot(2,3,2);
imshow(crop);
title('Кадрування');

%5.3 Децимація зображення
dec = crop(1:2:end,1:2:end,:);
subplot(2,3,3);
imshow(dec);
title('Децимація');

%5.4 Збільшення розмірів децимованого зображення в 2 рази
decbig = imresize(dec, 2, 'bilinear');
subplot(2,3,4);
imshow(decbig);
title('Розмір дец. х2');

%5.5 Поворот на 90º градусів кадрованого зображення
rot90 = imrotate(crop, 90, 'bilinear');
subplot(2,3,5);
imshow(rot90);
title('Поворот на 90º');

%5.6 Поворот на 45º градусів кадрованого зображення
rot45 = imrotate(crop, 45, 'bilinear');
subplot(2,3,6);
imshow(rot45);
title('Поворот на 45º');
