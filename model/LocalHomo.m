function rgbim = LocalHomo(I,Hh,Hl,D0,c,block)
%ȫ��̬ͬ�˲�
% rgbim = GlobalHomo(I,Hh,Hl,D0,c)
% I:����ͼ��
% Hh:��Ƶ����,��Ҫ����1
% Hl:��Ƶ����,ȡֵ��0��1֮��
% D0:��ֹƵ�ʣ�Խ��ͼ��Խ��
% c:��ϵ��
% block:�ֿ��С


hsiim = rgb2hsi(I);
im = hsiim(:,:,3);

[row,col] = size(im);
% ��Ĵ�СΪMb*Nb
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