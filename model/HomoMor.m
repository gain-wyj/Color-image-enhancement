function im_e = HomoMor(im,Hh,Hl,D0,c)
%基于HSI和局部同态滤波的彩色图像增强算法
% 作者： 张亚飞 谢明鸿
% 高斯同态滤波器参数的设置
% Hh = 1.2;  % 高频增益,需要大于1
% Hl = 0.5;  % 低频增益,取值在0和1之间
% D0 = 4;    % 截止频率，越大图像越亮
% c = 1;     % 锐化系数

%% 滤波器初始化
im = double(im);
[row, col] = size(im);

% 确定傅里叶变换的原点
x0 = floor(row/2);
y0 = floor(col/2);

% 初始化
H = zeros(row,col);

for i = 1:row
    for j = 1:col
        D = (i-x0)^2 + (j-y0)^2;
        if D == 0
            H(i,j) = Hl;
        else
            H(i,j) = (Hh-Hl) * (1 - exp(-c*D^2/(D0^2))) + Hl;  % 高斯同态滤波函数
        end
    end
end

%% 同态滤波
im_l = log(im + 0.000001);              % 取对数变换
im_f = fftshift(fft2(im_l));            % 傅里叶变换，并移到中心位置
im_nf = H .* im_f;                      % 高斯滤波
im_n = real(ifft2(ifftshift(im_nf)));   % 傅里叶反变换，恢复位置
im_e = exp(im_n - 0.000001);            % 取指数变化

end