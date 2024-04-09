%Lab2_3

% Очистка робочої пам'яті і закриття графічних вікон
clear; 
close all;

% Створимо об'єкт відеозахоплення
vid = videoinput('winvideo', 1, 'YUY2_1280x720');

% Встановимо властивість ReturnedColorSpace для півтонового подання
set(vid, 'ReturnedColorSpace', 'grayscale');

% Виконаємо предперегляд відеопотоку
preview(vid);
