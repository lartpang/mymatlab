%% �������������
clc;clear;

%% ������ص�����
N = 1024;
fs = 1000; % ����Ƶ��
t = (0: N - 1) / fs; % ʱ������
f_1 = 30;f_2 = 100;

%% ��������������������ź�
noise_gause = rand_gause(0, 1, N, 1);     %��˹������
rand_num_1 = rand_uniform(1, 1) * 2 * pi;    % �����������
rand_num_2 = rand_uniform(1, 2) * 2 * pi;
x_n = 2 * cos(2*pi*f_1*t + rand_num_1) + 5 * cos(2*pi*f_2*t + rand_num_2) + noise_gause;
figure,plot(x_n),title('�����źŵ�ͼ��');

%% ���㲢��������غ���
r_11 = R_11(x_n);
S_k = abs(fft_new(r_11));
f = (0 : N - 1) * fs / N / 2;
w = 10 * log10(S_k(1 : N));
m = -1023 : 1023;
figure,plot(m, r_11),title(' ����غ��� ');
xlabel('tao'),ylabel('R(tao)');
figure,plot(f, w),title(' ����غ��������ƹ����� ');
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');

%% ��matlab���ú�������
Nseg = 256;
window = hanning(Nseg);
noverlap = Nseg / 2;
f_1 = (0 : Nseg / 2) * fs / Nseg; %Ƶ��������
S_x = psd(x_n, Nseg, fs, window, noverlap, 'none'); %psd
figure;
plot(f_1, 10 * log10(S_x));
grid on,title('psd �������ƹ����� '); 
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');
S_x1 = pwelch(x_n, window, 128, Nseg, fs, 'onesided') * fs / 2; %pwelch
figure;
plot(f_1, 10 * log10(S_x1));
grid on,title('pwelch �������ƹ����� ');
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');

%% ����ͼ�ĶԱ�
figure;
subplot(3, 1, 1),plot(f, w / 2);
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');
title(' ����غ����Ĺ����� ');
subplot(3, 1, 2),plot(f_1, 10 * log10(S_x));
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');
title('psd �������ƹ����� ');
subplot(3, 1, 3),plot(f_1, 10 * log10(S_x1));
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');
title('pwelch �������ƹ����� ');