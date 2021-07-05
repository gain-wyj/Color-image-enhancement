close all;clear;clc
addpath('model');
addpath('src');


%  ��ȡͼ��
I = imread('4.1.01.tiff');
en = BlockAvEn(I,8);

% ȫ��̬ͬ�˲�
rgbim0 =  GlobalHomo(I,1.2,0.5,50,1);
en0 = BlockAvEn(rgbim0,8);

% �ֲ�̬ͬ�˲�
rgbim1 = LocalHomo(I,1.2,0.5,4,1,8);
en1 = BlockAvEn(rgbim1,8);

% �ֿ�̬ͬ�˲� 
rgbim2 = BlockHomo(I,1.2,0.5,4,1,8);
en2 = BlockAvEn(rgbim2,8);

figure(1)
subplot(1,4,1)
imshow(I);
title(['ԭʼͼ��',num2str(en)])

subplot(1,4,2)
imshow(rgbim0);
title(['ȫ��̬ͬ�˲���',num2str(en0)])

subplot(1,4,3)
imshow(rgbim1);
title(['�ֲ�̬ͬ�˲���',num2str(en1)])

subplot(1,4,4)
imshow(rgbim2);
title(['�ֿ�̬ͬ�˲���',num2str(en2)])