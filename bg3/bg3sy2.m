%% 准备环境
clear; clc;

%% 生成数据
%参数设置
N = 10000; M = 200;
f0 = 10000; deltf = 500; fs = 22000;
%调用产生窄带随机信号的函数
X = Narrowbandsignal(N, f0, deltf, fs, M);

%% 绘制窄带信号功率谱
figure;
subplot(2,1,1), plot(X), title('时域波形')
subplot(2,1,2), plot(periodogram(X))
title('窄带信号功率谱密度')

%% 自相关函数
%窄带随机信号样本的自相关函数
[Rx, lag] = xcorr(X, 'biased');
figure, plot(lag, Rx);
title('窄带信号自相关函数')

%% 计算Ac(t)、As(t)分量相关数据
%利用自编函数写出两个低频分量
[Ac, As]=Lowfsignal(X, f0, fs);
figure;
subplot(2, 1, 1); plot(Ac); title('Ac(t)时域波形')
subplot(2, 1, 2); plot(As); title('As(t)时域波形')
Rac = xcorr(Ac, 'biased');%低频过程Ac(t)样本的自相关函数
Ras = xcorr(As, 'biased');%低频过程As(t)样本的自相关函数
Racw = abs(fft(Rac));%低频过程Ac(t)样本的功率谱密度
Rasw = abs(fft(Ras));%低频过程As(t)样本的功率谱密度
Rxw = abs(fft(Rx));%窄带随机信号样本的功率谱密度

N1 = 2 * N - 1;
f = fs / N1 : fs / N1 : fs / 2;%频率轴的变换

%% 绘制图像
% 绘制自相关函数
figure; 
subplot(3, 1, 1); plot(Rx);
title('窄带随机信号样本的自相关函数');
subplot(3, 1, 2); plot(Rac);
title('低频过程Ac(t)样本的自相关函数');
subplot(3, 1, 3); plot(Ras);
title('低频过程As(t)样本的自相关函数');
% 绘制窄带、Ac(t)、As(t)分量功率谱密度
figure;
subplot(3, 1, 1); 
plot(f, 10 * log10(Rxw(1 : (N1 - 1) / 2) + eps));
title('窄带随机信号样本的功率谱密度');
subplot(3, 1, 2);
plot(f, 10 * log10(Racw(1 : (N1 - 1) / 2) + eps));
title('低频过程Ac(t)样本的功率谱密度');
subplot(3, 1, 3); 
plot(f, 10 * log10(Rasw(1 : (N1 - 1) / 2) + eps));
title('低频过程As(t)样本的功率谱密度');
