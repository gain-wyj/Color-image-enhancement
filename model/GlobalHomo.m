function rgbim = GlobalHomo(I,Hh,Hl,D0,c)
%ȫ��̬ͬ�˲�
% rgbim = GlobalHomo(I,Hh,Hl,D0,c)
% I:����ͼ��
% Hh:��Ƶ����,��Ҫ����1
% Hl:��Ƶ����,ȡֵ��0��1֮��
% D0:��ֹƵ�ʣ�Խ��ͼ��Խ��
% c:��ϵ��

hsiim = rgb2hsi(I);
im = hsiim(:,:,3);
im_g = HomoMor(im,Hh,Hl,D0,c);
hsiim(:,:,3) = im_g;
rgbim = hsi2rgb(hsiim);
end