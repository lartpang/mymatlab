%% 清除以前数据缓存以及命令行窗口的显示
clear;clc;

%% 产生高斯随机数
rand_num_x = rand_gause(1, sqrt(2), 10000, 1);
subplot(2, 1 ,1);
plot(rand_num_x),title(' 产生的高斯随机数 x ');

rand_num_y = rand_gause(3, 2, 10000, 2);
subplot(2, 1 ,2);
plot(rand_num_y),title(' 产生的高斯随机数 y ');

%% 求解x自相关函数
N = 10000;
figure;
Rx = R_11(rand_num_x);
subplot(221),plot(Rx);
axis([N-10 N+10 0 5]),title('x的自相关');
[Rx, l] = xcorr(rand_num_x, 'biased');
subplot(222),plot(l, Rx);
axis([-10 10 0 5]),title('x的自相关');

%% 求解y自相关函数
Ry = R_11(rand_num_y); 
subplot(223),plot(Ry);
axis([N-10 N+10 0 20]),title('y的自相关');
[Ry, m] = xcorr(rand_num_y, 'biased'); 
subplot(224),plot(m, Ry);
axis([-10 10 0 20]),title('y的自相关');

%% 求解x,y互相关函数
[Rxy, n] = xcorr(rand_num_x, rand_num_y, 'biased');
figure,plot(n, Rxy);
axis([-10 10 0 5]),title('x,y的互相关');