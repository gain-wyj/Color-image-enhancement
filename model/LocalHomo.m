function rgbim = LocalHomo(I,Hh,Hl,D0,c,block)
%全局同态滤波
% rgbim = GlobalHomo(I,Hh,Hl,D0,c)
% I:输入图像
% Hh:高频增益,需要大于1
% Hl:低频增益,取值在0和1之间
% D0:截止频率，越大图像越亮
% c:锐化系数
% block:分块大小


hsiim = rgb2hsi(I);
im = hsiim(:,:,3);

[row,col] = size(im);
% 块的大小为Mb*Nb
Mb = block; Nb = block;
rb = floor(row/Mb); cb = floor(col/Nb);
im_g = im;
for i =1:rb
    for j = 1:cb
        temp = im((i-1)*Mb+1:i*Mb , (j-1)*Nb+1:j*Nb);
        im_g((i-1)*Mb+1:i*Mb , (j-1)*Nb+1:j*Nb) = HomoMor(temp,Hh,Hl,D0,c);
    end
end
hsiim(:,:,3) = im_g;
rgbim = hsi2rgb(hsiim);

end