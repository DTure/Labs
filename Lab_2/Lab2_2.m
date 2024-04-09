%Lab2_2

% Очистка робочої пам'яті і закриття графічних вікон
clear; 
close all;

% Отримаємо інформацію про пристрій захоплення зображення 
devInfo = imaqhwinfo('winvideo', 1);
disp(devInfo);
% Нас цікавить DefaultFormat: 'RGB24_1280x720'

% Створимо об'єкти відеозахоплення з різними форматами
%vid = videoinput('winvideo', 1, 'YUY2_352x288');
%vid = videoinput('winvideo', 1, 'YUY2_848x480');
vid = videoinput('winvideo', 1, 'YUY2_1280x720');

% Виконаємо предперегляд відеопотоку
preview(vid);