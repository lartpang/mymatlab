%% 清屏及清除缓存
clear;clc;

%% 一些相应的函数
N = 500;
x_t = rand_gause(0, 1, N, 1);%产生M个样本，时间种子参数为1
figure,plot(x_t);
title('随机信号时域波形')
h_t = fir1(101, [0.3 0.4]);%101阶带通滤波器，数字截止频率为0.3和0.4
figure,plot(h_t);
title('冲激响应函数ht');
H_w = fft(h_t, 2 * N);%滤波器频率响应
figure,plot((1 : N) / N, abs(H_w(1 : N)));
title('传递函数Hw');

%% 周期图法估计 M个白噪声样本的功率谱
S_xx = abs(fft(x_t, 2 * N) .^ 2) / (2 * N);
H_w2 = abs(H_w) .^ 2;%系统的功率传输函数
S_yy = S_xx .* H_w2;%输出信号的功率谱
R_yy = fftshift(ifft(S_yy));%用IFFT求输出信号的自相关函数

%% 绘制图像
R_xx = R_11(x_t);%直接法估计白噪声的自相关函数
figure,stem(R_xx);
title('输入自相关函数Rxx');
w = (1 : N) / N;%功率谱密度横轴坐标
t = (-N : N - 1) / N * (N / 20000);%自相关函数横轴坐标
figure;
subplot(411), plot(w, abs(S_xx(1 : N)));
title(' 输入信号的功率谱密度 ');
xlabel('归一化频率f'),ylabel('Sxx(f)');
subplot(412),plot(w, abs(H_w2(1 : N)));
title(' 系统的功率传输函数 ');
xlabel('归一化频率f'),ylabel('Hw2(f)');
subplot(413),plot(w, abs(S_yy(1 : N)));
title(' 输出信号的功率谱密度 ');
xlabel('归一化频率f'),ylabel('Syy(f)');
subplot(414),plot(t, R_yy); 
title(' 输出函数的自相关函数 ');
xlabel('tao'),ylabel('Ryy(tao)');