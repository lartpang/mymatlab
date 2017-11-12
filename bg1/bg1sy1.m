%% 清除以前数据缓存以及命令行窗口的显示
clear;clc;

%% 均匀分布随机数的产生
rand_num = rand_uniform(10000, 1);
plot(rand_num),title(' 产生的均匀随机数 ');

%% 随机数的1~4阶原点矩
matrix_result = zeros(1,4);
% 因为原点矩就是所有的数据的各自的幂级数的平均值，可用如下方法计算。
for i = 1 : 10000
    matrix_result(1) = matrix_result(1) + rand_num(i);   
    matrix_result(2) = matrix_result(2) + rand_num(i)^2;
    matrix_result(3) = matrix_result(3) + rand_num(i)^3;
    matrix_result(4) = matrix_result(4) + rand_num(i)^4;
end
matrix_result = matrix_result / 10000;
disp([' 一阶原点矩 = ', num2str(matrix_result(1))]);
disp([' 二阶原点矩 = ', num2str(matrix_result(2))]);
disp([' 三阶原点矩 = ', num2str(matrix_result(3))]);
disp([' 四阶原点矩 = ', num2str(matrix_result(4))]);

%% 随机数的2~4阶中心矩
matrix_result_mid = zeros(1,3);
mean_num = matrix_result(1);
for i = 1 : 10000
    matrix_result_mid(1) = matrix_result_mid(1) + (rand_num(i) - mean_num)^2;
    matrix_result_mid(2) = matrix_result_mid(2) + (rand_num(i) - mean_num)^3;
    matrix_result_mid(3) = matrix_result_mid(3) + (rand_num(i) - mean_num)^4;
end
matrix_result_mid = matrix_result_mid / 10000;
disp([' 二阶中心矩 = ', num2str(matrix_result_mid(1))]);
disp([' 三阶中心矩 = ', num2str(matrix_result_mid(2))]);
disp([' 四阶中心矩 = ', num2str(matrix_result_mid(3))]);

%% 求中位数,众数,最大最小值
mid_num = median(rand_num);
mode_num = mode(rand_num);
max_num = max(rand_num);
min_num = min(rand_num);
disp([' 中位数 = ', num2str(mid_num)]);
disp([' 众数 = ', num2str(mode_num)]);
disp([' 最大值 = ', num2str(max_num)]);
disp([' 最小值 = ', num2str(min_num)]);

%% 频度直方图
figure,subplot(211);
hist(rand_num),title('10 个区间 ');
subplot(212);
hist(rand_num,100),title('100 个区间 ');
