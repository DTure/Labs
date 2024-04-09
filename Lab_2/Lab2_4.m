%Lab2_3

% Очистка робочої пам'яті і закриття графічних вікон
clear; 
close all;

% Створимо об'єкт відеозахоплення
vid = videoinput('winvideo', 1, 'YUY2_1280x720');

% Встановлюємо кількість кадрів та півтонове подання
FrameNum = 100;
set(vid, 'ReturnedColorSpace', 'grayscale', 'FramesPerTrigger', FrameNum);

% Запускаємо захоплення відеозображень та чекаємо його завершення
start(vid);
wait(vid, FrameNum, 'logging');

% Перемістимо захоплені зображення з тимчасового буфера пам'яті
[VideoData, time] = getdata(vid);

% Рахуємо кадри за секунду та виводимо результат
fps = FrameNum/(time(end)-time(1));
fprintf('Acquisition time: %g; frames per second: %g.\n',time(end)-time(1), fps);

% Запускаємо відображення захоплених зображень зі швидкістю їх запису
mplay(VideoData, fps);

% Видаляємо об'єкт відеозахоплення
delete(vid);

