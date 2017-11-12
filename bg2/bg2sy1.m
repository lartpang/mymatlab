%% 清屏及清除缓存
clc;clear;

%% 设置相关的数据
N = 1024; 
f_1 = 30; f_2 = 100;
fs = 1000;% 采样频率
t = (0: N - 1) / fs;% 时间序列
f = (0 : N / 2 - 1) * fs / N;% 频率轴坐标

%% 生成噪声与随机变量、信号
noise_gause = rand_gause(0, 1, N, 1);%高斯白噪声
rand_num_1 = rand_uniform(1, 1) * 2 * pi;% 均匀随机变量
rand_num_2 = rand_uniform(1, 2) * 2 * pi;
x_n = 2 * cos(2*pi*f_1*t + rand_num_1) + 5 * cos(2*pi*f_2*t + rand_num_2) + noise_gause;
figure,plot(x_n),title('生成信号的图像');

%% 周期图法估计功率谱并绘图
X_k = fft_new(x_n);% 自己写的傅里叶变换
S_k = (abs(X_k) .^ 2) / N;
dB = 10 * log10(S_k(1 : N / 2));% 纵轴转化为dB/Hz
figure,plot(f, dB),title(' 周期法估算随机信号功率谱 ');
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');

%% 使用matlab自带函数计算功率谱并绘制图像
S_k = periodogram(x_n);
dB = 10 * log10(S_k(1 : N / 2));
figure,plot(f, dB),title('periodogram函数算随机信号功率谱 ');
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');

%% 两种计算函数的图像对比
figure;
subplot(2,1,1),plot(f, dB);
title(' 周期图法估算随机信号功率谱 ');
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');
subplot(2,1,2),plot(f, dB);
title('periodogram 函数算随机信号功率谱 ')
xlabel('f/Hz'),ylabel('Sx(f)(dB/Hz)');