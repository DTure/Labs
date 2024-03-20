% Lab1_3

% Очистка робочої пам'яті і закриття графічних вікон
clear; 
close all;

%3 Налаштовання шляху та отримання фото
path ='D:\Study\ЦОЗ\Complete\Lab_1\photo.jpg';
photo = imread(path);

% Створення графічного вікна
figure("Name","Task3","Position",[100,100,700,600]);

%3.1 Відображення файлу як зображення
subplot(2,3,1);
imshow(photo);
axis('image');
title('Кольорове');

%3.2 Перетворення в зобр. відтінків сірого
subplot(2,3,2);
imshow(rgb2gray(uint8(photo)));
title('Відтінки сірого');

%3.2 Перетворення в чорно-біле зобр. 
subplot(2,3,3);
imshow(im2bw(uint8(photo)));
title('Чорно-біле');

%3.4 Відображення розподілу про червоний основний колір
subplot(2,3,4);
imshow(photo(:,:,1));
title('Червоний');

%3.5 Відображення розподілу про зелений основний колір
subplot(2,3,5);
imshow(photo(:,:,2));
title('Зелений');

%3.6 Відображення розподілу про синій основний колір
subplot(2,3,6);
imshow(photo(:,:,3));
title('Синій');

%3.7 Вивід інформації про зображення
info = imfinfo(path);
fieldinfo = fieldnames(info);
info = rmfield(info, fieldinfo(structfun(@isempty, info)));
disp(info);

