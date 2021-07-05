function rgbim = BlockHomo(I,Hh,Hl,D0,c,block)
%�ֿ�̬ͬ�˲�
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

% �ֿ�̬ͬ�˲� 
M = 3; N = 3;
n0 = floor(N/2); m0 = floor(M/2);
Ide = im_g;

% ȥ��ˮƽ������ͼ���ЧӦ
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
% ȥ����ֱ������ͼ���ЧӦ
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