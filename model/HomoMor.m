function im_e = HomoMor(im,Hh,Hl,D0,c)
%����HSI�;ֲ�̬ͬ�˲��Ĳ�ɫͼ����ǿ�㷨
% ���ߣ� ���Ƿ� л����
% ��˹̬ͬ�˲�������������
% Hh = 1.2;  % ��Ƶ����,��Ҫ����1
% Hl = 0.5;  % ��Ƶ����,ȡֵ��0��1֮��
% D0 = 4;    % ��ֹƵ�ʣ�Խ��ͼ��Խ��
% c = 1;     % ��ϵ��

%% �˲�����ʼ��
im = double(im);
[row, col] = size(im);

% ȷ������Ҷ�任��ԭ��
x0 = floor(row/2);
y0 = floor(col/2);

% ��ʼ��
H = zeros(row,col);

for i = 1:row
    for j = 1:col
        D = (i-x0)^2 + (j-y0)^2;
        if D == 0
            H(i,j) = Hl;
        else
            H(i,j) = (Hh-Hl) * (1 - exp(-c*D^2/(D0^2))) + Hl;  % ��˹̬ͬ�˲�����
        end
    end
end

%% ̬ͬ�˲�
im_l = log(im + 0.000001);              % ȡ�����任
im_f = fftshift(fft2(im_l));            % ����Ҷ�任�����Ƶ�����λ��
im_nf = H .* im_f;                      % ��˹�˲�
im_n = real(ifft2(ifftshift(im_nf)));   % ����Ҷ���任���ָ�λ��
im_e = exp(im_n - 0.000001);            % ȡָ���仯

end