%% 清除以前数据缓存以及命令行窗口的显示
clear;clc;

%% 生成高斯序列
rand_num_x = rand_gause(0, 1, 40000);
rand_num_y = rand_gause(0, 1, 40000);

list = [1, 4, 20, 80, 400];

for i = 1: length(list)
    num = list(i);
    N = 40000 / num;
    x = zeros(length(list), N);
    x(i, 1: N) = rand_num_x(1: num: 40000);
    [Rx, a] = xcorr(x(i, :), 94, 'biased');
    subplot(3, 2, i)
    plot(a, Rx);
    title('x取点后的自相关');
end

figure;
for i = 1: length(list)
    num = list(i);
    N = 40000 / num;
    x = zeros(length(list), N);
    y = zeros(length(list), N);
    x(i, 1: N) = rand_num_x(1: num: 40000);
    y(i, 1: N) = rand_num_y(1: num: 40000);
    [Rxy, b] = xcorr(x(i, 1: N), y(i, 1: N), 94, 'biased');
    subplot(3, 2, i)
    plot(b, Rxy);
    title('x&y取点后的自相关');
end