close all;clear;clc
addpath('model');
addpath('src');


%  读取图像
I = imread('4.1.01.tiff');
en = BlockAvEn(I,8);

% 全局同态滤波
rgbim0 =  GlobalHomo(I,1.2,0.5,50,1);
en0 = BlockAvEn(rgbim0,8);

% 局部同态滤波
rgbim1 = LocalHomo(I,1.2,0.5,4,1,8);
en1 = BlockAvEn(rgbim1,8);

% 分块同态滤波 
rgbim2 = BlockHomo(I,1.2,0.5,4,1,8);
en2 = BlockAvEn(rgbim2,8);

figure(1)
subplot(1,4,1)
imshow(I);
title(['原始图像：',num2str(en)])

subplot(1,4,2)
imshow(rgbim0);
title(['全局同态滤波：',num2str(en0)])

subplot(1,4,3)
imshow(rgbim1);
title(['局部同态滤波：',num2str(en1)])

subplot(1,4,4)
imshow(rgbim2);
title(['分块同态滤波：',num2str(en2)])