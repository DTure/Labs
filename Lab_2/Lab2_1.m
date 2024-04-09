%Lab2_1

% Очистка робочої пам'яті і закриття графічних вікон
clear; 
close all;

% Виводимо інформацію про пристрої та наявні в системі адаптери
imaqInfo = imaqhwinfo;
disp('imaqInfo:');
disp(imaqInfo);
InstalledAdaptors = imaqInfo.InstalledAdaptors;
fprintf('\b InstalledAdaptors:');
disp(InstalledAdaptors);

% Цикл для знаходження адаптера  що пов'язаний
% з наявним в комп'ютері пристроєм захвату зображень
adaptNum = 0;
for i = 1:length(InstalledAdaptors)
    if ~isempty( imaqhwinfo(InstalledAdaptors{i}, 'DeviceInfo') )
        adaptNum = i;
        break
    end
end

% Перевірка відсутності потрібного адаптера
if adaptNum == 0
    fprintf('No hardware adapter for video capture detected.\n')
    return
end    

% Виводимо інформацію про обраний адаптер
hwInfo = imaqhwinfo(InstalledAdaptors{adaptNum});
AdaptorName = hwInfo.AdaptorName;
deviceID = hwInfo.DeviceIDs{1};
fprintf('\bInformation about the adaptor ''%s'' for deviceID №%i:\n', AdaptorName,deviceID);
disp(hwInfo);

% Виводимо інформацію про пристрій захоплення зображення
DeviceInfo = hwInfo.DeviceInfo;
fprintf('\bDeviceInfo:\n');
disp(DeviceInfo);

% Визначимо формат відео при захопленні
vFormat = char(DeviceInfo.SupportedFormats(end));
fprintf('\bUsedFormats: %s\n', vFormat);

% Створимо об'єкт відеозахоплення та переглянемо інформацію 
% про нього та відповідне відеоджерело
vid = videoinput( AdaptorName, deviceID, vFormat );
disp('Video Input Object:'); 
disp(vid);
Source = vid.Source;
disp('Video Source Object:'); 
disp(Source);

% Виконаємо предперегляд відеопотоку
preview(vid);