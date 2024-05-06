%Lab3_1

% Очистка робочої пам'яті і закриття графічних вікон
clear; 
close all;

% Задаємо розміри зображення
M = 240;
J = 320;
N = M*J;
fprintf(['К-ть рядків M: %i; К-ть стовпчиків J: %i; К-ть ' ...
    'пікселів N: %i.\n'], M, J, N)

% Визначаємо такі часові параметри як
% Тривалість кадру
T = 1e3/50;
dt = T/N;
t = (0:N-1)*dt;
fprintf(['Тривалість кадру: %g мс; крок дискретизації: ' ...
    '%5.1e мс.\n'], T, dt);

% Частоту дискретизації
fs = 1/dt;
df = fs/N;
f = (0:N-1)*df;
fprintf(['Частота дискретизації: %g кГц; частотний крок: ' ...
    '%g кГц.\n'], fs, df);

% Частоту кадрової розгортки
fy = 1/T; 
fx = M*fy; 
fprintf(['Частота кадрової розгортки fy = %g Гц; частота ' ...
    'рядкової розгортки fx = %g кГц.\n'], 1e3*fy, fx);

% РОБОТА З ПЕРШИМ ЗОБРАЖЕННЯМ  
% 16 вертикальних чорних смуг рівної ширини, 
% розділених білими смугами такої ж ширини

% Задаємо початкові параметри
K = 16;
%K = 16*2;
Fx = K/J/dt;
fprintf('Частота полос по x: Fx = K*fx = %g кГц.\n', Fx);

% Формуємо смуги на зображенні
row = pulstran(0:J-1, (0.25:K)*J/K, 'rectpuls', J/K/2);
Image = repmat(row, M, 1);

% Відображаємо отримане зображення
figure('Name', 'Image 1');
imshow(Image); 
%title('Image 1');

% Подаємо зображення як сигнал розкладання
s = Image';
s = s(:);

% Графічно відображаємо сигнал
figure('Name', 'Videosignal 1', 'WindowStyle', 'docked');
plot(t, s, '.k-'); grid on
axis([t(1) t(2*J) -inf inf]);
xlabel('t, ms'); 
ylabel('s(t)');
title('Videosignal 1');

% Перетворюємо часовий сигнал в спектр
% (функція швидкого перетворення Фур'є)
S = fft(s);

%Графічно відображаємо спектр
figure('Name', 'Spectrum 1', 'WindowStyle', 'docked');
plot(f, abs(S), '.k-'); grid on
axis([f(1) fs/2 -inf inf]);
xlabel('f, кHz'); 
ylabel('|S(f)|');
title('Spectrum of videosignal 1');

% РОБОТА З ДРУГИМ ЗОБРАЖЕННЯМ
% 24 горизонтальних чорних смуг рівної ширини,
% розділених білими смугами такої ж ширини;

% Задаємо початкові параметри
L = 24;
%L = 24*2;
Fy = L/M/J/dt;
fprintf('Частота смуг по y: Fy = L*fy = %g кГц.\n', Fy);

% Формуємо смуги на зображенні
col = pulstran(0:M-1, (0.25:L)*M/L, 'rectpuls', M/L/2)';
Image = repmat(col, 1, J);

% Відображаємо отримане зображення
figure('Name', 'Image 2');
imshow(Image); 
%title('Image 2');

% Подаємо зображення як сигнал розкладання
s = Image';
s = s(:);

% Графічно відображаємо сигнал
figure('Name', 'Videosignal 2', 'WindowStyle', 'docked');
plot(t, s, '.k-'); grid on
axis([t(1) t(2*J*M/L) -inf inf]);
xlabel('t, ms'); 
ylabel('s(t)');
title('Videosignal 2');

% Перетворюємо часовий сигнал в спектр
% (функція швидкого перетворення Фур'є)
S = fft(s);

%Графічно відображаємо спектр
figure('Name', 'Spectrum 2', 'WindowStyle', 'docked');
plot(f, abs(S), '.k-'); grid on
axis([f(1) M*fx/L -inf inf]);
xlabel('f, кHz'); 
ylabel('|S(f)|');
title('Spectrum of videosignal 2');

% РОБОТА З ТРЕЙТІМ ЗОБРАЖЕННЯМ
% перетину 24 горизонтальних білих смуг рівної ширини,
% розділених чорними смугами такої ж ширини,
% і 16 вертикальних білих смуг рівної ширини,
% розділених чорними смугами такої ж ширини.

% Формуємо зображення використовуючи два попередніх
Image = repmat(row, M, 1);
Image(~col,:) = ~Image(~col,:);

% Виконуємо аналогічні дії до попередніх пунктів зі
% зміною номерів зображень та іншими обмеженнями граіфіків

figure('Name', 'Image 3');
imshow(Image); 
%title('Image 3');

s = Image';
s = s(:);

figure('Name', 'Videosignal 3', 'WindowStyle', 'docked');
plot(t, s, '.k-'); grid on
axis([t(J*M/L-J) t(J*M/L+J) -inf inf]);
xlabel('t, ms'); 
ylabel('s(t)');
title('Videosignal 3');

S = fft(s - mean(s));

figure('Name', 'Spectrum 3', 'WindowStyle', 'docked');
plot(f, abs(S), '.k-'); grid on
axis([f(1) fs/2 -inf inf]);
xlabel('f, кHz'); 
ylabel('|S(f)|');
title('Spectrum of videosignal 3');
