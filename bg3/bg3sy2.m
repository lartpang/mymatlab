%% ׼������
clear; clc;

%% ��������
%��������
N = 10000; M = 200;
f0 = 10000; deltf = 500; fs = 22000;
%���ò���խ������źŵĺ���
X = Narrowbandsignal(N, f0, deltf, fs, M);

%% ����խ���źŹ�����
figure;
subplot(2,1,1), plot(X), title('ʱ����')
subplot(2,1,2), plot(periodogram(X))
title('խ���źŹ������ܶ�')

%% ����غ���
%խ������ź�����������غ���
[Rx, lag] = xcorr(X, 'biased');
figure, plot(lag, Rx);
title('խ���ź�����غ���')

%% ����Ac(t)��As(t)�����������
%�����Աຯ��д��������Ƶ����
[Ac, As]=Lowfsignal(X, f0, fs);
figure;
subplot(2, 1, 1); plot(Ac); title('Ac(t)ʱ����')
subplot(2, 1, 2); plot(As); title('As(t)ʱ����')
Rac = xcorr(Ac, 'biased');%��Ƶ����Ac(t)����������غ���
Ras = xcorr(As, 'biased');%��Ƶ����As(t)����������غ���
Racw = abs(fft(Rac));%��Ƶ����Ac(t)�����Ĺ������ܶ�
Rasw = abs(fft(Ras));%��Ƶ����As(t)�����Ĺ������ܶ�
Rxw = abs(fft(Rx));%խ������ź������Ĺ������ܶ�

N1 = 2 * N - 1;
f = fs / N1 : fs / N1 : fs / 2;%Ƶ����ı任

%% ����ͼ��
% ��������غ���
figure; 
subplot(3, 1, 1); plot(Rx);
title('խ������ź�����������غ���');
subplot(3, 1, 2); plot(Rac);
title('��Ƶ����Ac(t)����������غ���');
subplot(3, 1, 3); plot(Ras);
title('��Ƶ����As(t)����������غ���');
% ����խ����Ac(t)��As(t)�����������ܶ�
figure;
subplot(3, 1, 1); 
plot(f, 10 * log10(Rxw(1 : (N1 - 1) / 2) + eps));
title('խ������ź������Ĺ������ܶ�');
subplot(3, 1, 2);
plot(f, 10 * log10(Racw(1 : (N1 - 1) / 2) + eps));
title('��Ƶ����Ac(t)�����Ĺ������ܶ�');
subplot(3, 1, 3); 
plot(f, 10 * log10(Rasw(1 : (N1 - 1) / 2) + eps));
title('��Ƶ����As(t)�����Ĺ������ܶ�');
