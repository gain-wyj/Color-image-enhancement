function en = BlockAvEn(I,block)
%�ֲ�ƽ����Ϣ��
% en = BlockAvEn(I,block)
% I:����ͼ��
% block:�ֿ��С
en = 0;
[row,col,channel] = size(I);
% ��Ĵ�СΪMb*Nb
Mb = block; Nb = block;
rb = floor(row/Mb); cb = floor(col/Nb);
for c = 1:channel
    im = I(:,:,c);
    for i =1:rb
        for j = 1:cb
            temp = im((i-1)*Mb+1:i*Mb , (j-1)*Nb+1:j*Nb);
            en = en + entropy(temp);
        end
    end
end
en = en/(rb*cb*channel);
end
