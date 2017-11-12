%% 清屏及清除缓存
clc;clear;

%% 设置相关的数据
N = 1024;
fs = 1000; % 采样频率
t = (0: N - 1) / fs; % 时间序列
f_1 = 30;f_2 = 100;

%% 生成噪声与随机变量、信号
noise_gause = rand_gause(0, 1, N, 1);     %高斯白噪声
rand_num_1 = rand_uniform(1, 1) * 2 * pi;    % 均匀随机变量
rand_num_2 = rand_uniform(1, 2) * 2 * pi;
x_n = 2 * cos(2*pi*f_1*t + rand_num_1) + 5 * cos(2*pi*f_2*t + rand_num_2) + noise_gause;
figure,plot(x_n),title('生成信号的图像');

%% 计算并绘制自相关函数
r_11 = R_11(x_n);
S_k = abs(fft_new(r_11));
f = (0 : N - 1) * fs / N / 2;
w = 10 * log10(S_k(1 : N));
m = -1023 : 1023;
figure,plot(m, r_11),title(' 自相关函数 ');
xlabel('tao'),ylabel('R(tao)');
figure,plot(f, w),title(' 自相关函数法估计功率谱 ');
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');

%% 用matlab内置函数处理
Nseg = 256;
window = hanning(Nseg);
noverlap = Nseg / 2;
f_1 = (0 : Nseg / 2) * fs / Nseg; %频率坐标轴
S_x = psd(x_n, Nseg, fs, window, noverlap, 'none'); %psd
figure;
plot(f_1, 10 * log10(S_x));
grid on,title('psd 函数估计功率谱 '); 
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');
S_x1 = pwelch(x_n, window, 128, Nseg, fs, 'onesided') * fs / 2; %pwelch
figure;
plot(f_1, 10 * log10(S_x1));
grid on,title('pwelch 函数估计功率谱 ');
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');

%% 三幅图的对比
figure;
subplot(3, 1, 1),plot(f, w / 2);
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');
title(' 自相关函数的功率谱 ');
subplot(3, 1, 2),plot(f_1, 10 * log10(S_x));
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');
title('psd 函数估计功率谱 ');
subplot(3, 1, 3),plot(f_1, 10 * log10(S_x1));
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');
title('pwelch 函数估计功率谱 ');