%% �������������
clc;clear;

%% ������ص�����
N = 1024; 
f_1 = 30; f_2 = 100;
fs = 1000;% ����Ƶ��
t = (0: N - 1) / fs;% ʱ������
f = (0 : N / 2 - 1) * fs / N;% Ƶ��������

%% ��������������������ź�
noise_gause = rand_gause(0, 1, N, 1);%��˹������
rand_num_1 = rand_uniform(1, 1) * 2 * pi;% �����������
rand_num_2 = rand_uniform(1, 2) * 2 * pi;
x_n = 2 * cos(2*pi*f_1*t + rand_num_1) + 5 * cos(2*pi*f_2*t + rand_num_2) + noise_gause;
figure,plot(x_n),title('�����źŵ�ͼ��');

%% ����ͼ�����ƹ����ײ���ͼ
X_k = fft_new(x_n);% �Լ�д�ĸ���Ҷ�任
S_k = (abs(X_k) .^ 2) / N;
dB = 10 * log10(S_k(1 : N / 2));% ����ת��ΪdB/Hz
figure,plot(f, dB),title(' ���ڷ���������źŹ����� ');
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');

%% ʹ��matlab�Դ��������㹦���ײ�����ͼ��
S_k = periodogram(x_n);
dB = 10 * log10(S_k(1 : N / 2));
figure,plot(f, dB),title('periodogram����������źŹ����� ');
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');

%% ���ּ��㺯����ͼ��Ա�
figure;
subplot(2,1,1),plot(f, dB);
title(' ����ͼ����������źŹ����� ');
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');
subplot(2,1,2),plot(f, dB);
title('periodogram ����������źŹ����� ')
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');