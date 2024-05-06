%Lab3_3

% Очистка робочої пам'яті і закриття графічних вікон
clear; 
close all;

% Зображення для роботи
figure('Name', 'Photo');
%P = imread('blobs.png');
%P = imread('cameraman.tif');
%P = imread('testpat1.png');
%P = imread('text.png');
P = imread('D:\Study\ЦОЗ\Complete\Lab_3\photo.jpg');
P = rgb2gray(P); 

% Виводимо оригінальне зображення
imshow(P); 
title('Photo');

% Визначаємо число рядків, стовпців та пікселів
[Mp, Jp] = size(P);
Np = Mp*Jp;
fprintf(['Число рядків фотографії M: %i; число стовпців фотографії J: ' ...
    '%i;число пікселів фотографії N: %i.\n'], Mp, Jp, Np);

% Формуємо вектор з відліками часової розгортки 
T = 1e3/50;
tp = (0:Np-1)*T/Np;

% Визначаємо частотні параметри
fsP = Np/T;
dfP = fsP/Np;
fy = 1/T;
fprintf(['Частота дискретизації фотографії: %g кГц; ' ...
    'частотний крок: %gкГц.\n'], fsP, dfP);
fprintf('Частота рядкової розгортки фотографії fx: %g кГц.\n', Mp*fy);
fP = (0:Np-1)*dfP;

% Подаємо зображення як сигнал розкладання
p = P';
p = p(:);

% Відобразимо отриманий сигнал розкладання
%Перші 50 рядків
figure('Name', 'Photosignal', 'WindowStyle', 'docked');
subplot(2,1,1); plot(tp, p, '.k-'); 
axis([tp(1) tp(50*Jp) -inf inf]);
xlabel('t, ms'); 
ylabel('s(t)'); 
title('First 50 row of photosignal'); grid on
subplot(2,1,2); 
% Останні 50 рядків
plot(tp, p, '.k-'); 
axis([tp(51*Jp) tp(100*Jp) -inf inf]);
xlabel('t, ms'); 
ylabel('s(t)'); 
title('Second 50 row of photosignal'); grid on

% Отримуємо та виводимо спектру сигналу розкладання
Q = fft(double(p) - mean(p));
figure('Name', 'Spectrum of photo', 'WindowStyle', 'docked');
plot(fP, abs(Q), '.k-'); 
axis([fP(1) fsP/4 -inf inf]); grid on
xlabel('f, кHz'); 
ylabel('|S(f)|'); 
title('Spectrum of photo');

% Для того щоб зменшити час на аналіз характеру спотворень під час
% передачі фотографій вузькосмуговими каналами зв'язку ми створимо
% функцію, аналогічно до того як це було винонано в інших скриптах 
% без написання функції

% Виклик функції з потрібними параметрами
passedPhoto(0, 400, Q, p, fP, Jp, Mp);
passedPhoto(190, 194, Q, p, fP, Jp, Mp);
passedPhoto(188, 196, Q, p, fP, Jp, Mp);
passedPhoto(192, 201, Q, p, fP, Jp, Mp);
passedPhoto(400, 800, Q, p, fP, Jp, Mp);

% Текст функції
function passedPhoto(fMin, fMax, Q, p, fP, Jp, Mp)
   ind = (fMin<=fP & fP<=fMax);
   ind(2:end) = ind(2:end) | ind(end:-1:2);

   Qp = zeros(size(Q));
   Qp(ind) = Q(ind);

   pp = ifft(Qp) + mean(p);
   Pp = reshape( uint8(pp), Jp, Mp )';

   figure('Name', 'Passed photo');
   imshow(Pp); 
   title(sprintf('Passed photo,  %d - %d кГц ',fMin,fMax));
end


