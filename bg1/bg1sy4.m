%清除以前数据缓存以及命令行窗口的显示
clear;clc;

%% 高斯分布随机数的产生
x = rand_gause(1, 2, 10000, 1);
N = input('请输入N(N<200):');
y = zeros(1, length(x));
for i = 1: length(x)-N
    y(i + N) = x(i);    
end
figure;
subplot(311),plot(x(1: 2000));
title('原函数图像');
y(1: N) = rand_uniform(N, 1); y1 = y;
subplot(312),plot(y(1: 2000));
title('用均匀随机数替换前N点的延时的图像');
y(1: N) = zeros(1, N); y2 = y;
subplot(313),plot(y(1: 2000));
title('用0替换前N点的延时的图像');

%% 计算互相关
figure;
[Rxy_1, l] = xcorr(y1, x, 'biased');
subplot(311),plot(l, Rxy_1);
axis([-500 500 0 10]);
title('与 由均匀随机数替换前N点的y 的互相关函数');
[Rxy_2, m] = xcorr(y2, x, 'biased');
subplot(312),plot(m, Rxy_2);
axis([-500 500 0 10]);
title('与 由0替换前N点的y 的互相关函数');
Rx = R_11(x);
subplot(313),plot(Rx);
axis([9500 10500 0 10]);
title('自相关函数');

%% 求取大致延迟
max_num_11 = max(Rxy_1);
for i_1 = 1: length(Rxy_1)
    if(Rxy_1(i_1) == max_num_11)
        break;
    end
end
max_num_12 = max(Rxy_2);
for i_2 = 1: length(Rxy_2)
    if(Rxy_2(i_2) == max_num_12)
        break;
    end
end
max_num_2 = max(Rx);
for j = 1: length(Rx)
    if(Rx(j) == max_num_2)
        break;
    end
end
disp([' 由均匀随机数替换前N点大致时间延迟 = ', num2str(i_1-j)]);
disp([' 由0替换前N点大致时间延迟 = ', num2str(i_2-j)]);