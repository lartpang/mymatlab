%% ׼������
clear; clc;

%% ���������ź�
N = 20000; % 20000��
f = 1000; % Ƶ��1000Hz
fs = 16000; % ������16000Hz
data_sin = sin(2 * pi * f / fs * (1 : N));
figure, plot(data_sin(1 : 99));
title('20000�������ź�1000Hz��������16000Hz');

%% 1: ʱ��任���
step = 20000;
h = zeros(1, step);
for i = 1 : step
    cul = i - step / 2;
    ind = bitand(abs(cul), 1);
    %��λ�룬ż�������ƽ�β��0������Ϊ1
    if(ind == 1);%abs(cul)Ϊ����
        h(i) = 2 / pi / cul;
        %���Ҹ�һ�룬��������
    end
end
figure, stem(h(9950 : 10049)), title('ʱ��弤��Ӧ');

%% ʱ��任�������õ�cos����
data_cos = conv(data_sin, h, 'same');
figure, plot(data_cos(1 : 99), 'r');
title('ʱ��任�������õ�cos����')

%% ʱ�򷽷�����У��
[c, l] = xcorr(data_sin, data_cos, 'coeff');
figure, stem(l, c), axis([9950 10050 -1 1]);
title('ʱ��任�����������У�� �������źŻ���غ�������')
[~, indx] = max(c);
D = abs(indx - N) + 1

figure, plot(data_sin), hold on
plot(data_cos, 'r');
axis([0 100 -1.5 1.5]);
title('�任ǰ�����ݶԱ�')
legend('�任ǰ', '�任��')

%% ������λ��
[~, I] = find(data_sin == 1);
T = I(2) - I(1)
delta = D / T;
disp(['��λ��Ϊ��', num2str(delta * 2), 'pi'])

%% 2��Ƶ��任�˻�
% Ƶ���亯��
H = zeros(1, N);
for p = 1 : N
    if(p <= N / 2)
        H(p) = -1i;
    else
        H(p) = 1i;
    end
end
figure, stem(imag(H)), axis([9950 10050 -1 1]);
title('Ƶ��弤��Ӧ')

data_cos = real(ifft(fft(data_sin) .* H));
figure;
subplot(211), plot(data_sin(1 : 99)), hold on
title('Ƶ��任ԭ����sin����')
subplot(212), plot(data_cos(1 : 99), 'r')
title('Ƶ��任�˻��õ�cos����')

%% Ƶ�򷽷�����У��

[c, l] = xcorr(data_sin, data_cos, 'coeff');
figure, stem(l,c), axis([9950 10050 -1 1]);
title('Ƶ�򷽷�����У�� �������źŻ���غ�������')
[~, indx] = max(c);
D = abs(indx - N)

figure, plot(data_sin), hold on
plot(data_cos, 'r')
axis([0 100 -1.5 1.5]);
title('�任ǰ�����ݶԱ�')
legend('�任ǰ','�任��')

[~, I] = find(data_sin == 1);
T = I(4) - I(3)
delta = D / T;
disp(['��λ��Ϊ��', num2str(delta * 2), 'pi'])

%% 3.�Ա����ú��� hilbert
data_cos = imag(hilbert(data_sin));
figure, plot(data_cos(1 : 99), 'r')
title('���ú��� hilbert�任����')

%% ���ú��� hilbert��������У��
[c, l] = xcorr(data_sin, data_cos, 'coeff');
figure, stem(l,c), axis([9950 10050 -1 1]);
title('���ú��� hilbert ����У�� �������źŻ���غ�������')
[m, indx] = max(c);
D = abs(indx - N)

figure; 
plot(data_sin); hold on
plot(data_cos, 'r')
axis([0 100 -1.5 1.5]);
title('�任ǰ�����ݶԱ�')
legend('�任ǰ','�任��')

[~, I] = find(data_sin == 1);
T = I(2) - I(1)
delta = D / T;
disp(['��λ��Ϊ��', num2str(delta * 2), 'pi'])