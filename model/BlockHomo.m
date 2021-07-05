function rgbim = BlockHomo(I,Hh,Hl,D0,c,block)
%分块同态滤波
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

% 分块同态滤波 
M = 3; N = 3;
n0 = floor(N/2); m0 = floor(M/2);
Ide = im_g;

% 去除水平相邻子图像块效应
for i = 1:row
    for j = Nb:Nb:col-Nb
        temp1 = 0;
        temp2 = 0;
        for k = -n0:n0
            temp1 = temp1 + im_g(i,j+k);
            temp2 = temp2 + im_g(i,j+1+k);
        end
        Ide(i,j) = temp1/N;
        Ide(i,j+1) = temp2/N;
    end
end
% 去除垂直相邻子图像块效应
for i = Mb:Mb:row-Nb
    for j =  1:col
        temp1 = 0;
        temp2 = 0;
        for k = -m0:m0
            temp1 = temp1 + im_g(i+k,j);
            temp2 = temp2 + im_g(i+1+k,j);
        end
        Ide(i,j) = temp1/M;
        Ide(i+1,j) = temp2/M;
    end
end
hsiim(:,:,3) = Ide;
rgbim = hsi2rgb(hsiim);

end