function rgbim = GlobalHomo(I,Hh,Hl,D0,c)
%全局同态滤波
% rgbim = GlobalHomo(I,Hh,Hl,D0,c)
% I:输入图像
% Hh:高频增益,需要大于1
% Hl:低频增益,取值在0和1之间
% D0:截止频率，越大图像越亮
% c:锐化系数

hsiim = rgb2hsi(I);
im = hsiim(:,:,3);
im_g = HomoMor(im,Hh,Hl,D0,c);
hsiim(:,:,3) = im_g;
rgbim = hsi2rgb(hsiim);
end