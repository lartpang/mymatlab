%% �����ǰ���ݻ����Լ������д��ڵ���ʾ
clear;clc;

%% ���ȷֲ�������Ĳ���
rand_num = rand_uniform(10000, 1);
plot(rand_num),title(' �����ľ�������� ');

%% �������1~4��ԭ���
matrix_result = zeros(1,4);
% ��Ϊԭ��ؾ������е����ݵĸ��Ե��ݼ�����ƽ��ֵ���������·������㡣
for i = 1 : 10000
    matrix_result(1) = matrix_result(1) + rand_num(i);   
    matrix_result(2) = matrix_result(2) + rand_num(i)^2;
    matrix_result(3) = matrix_result(3) + rand_num(i)^3;
    matrix_result(4) = matrix_result(4) + rand_num(i)^4;
end
matrix_result = matrix_result / 10000;
disp([' һ��ԭ��� = ', num2str(matrix_result(1))]);
disp([' ����ԭ��� = ', num2str(matrix_result(2))]);
disp([' ����ԭ��� = ', num2str(matrix_result(3))]);
disp([' �Ľ�ԭ��� = ', num2str(matrix_result(4))]);

%% �������2~4�����ľ�
matrix_result_mid = zeros(1,3);
mean_num = matrix_result(1);
for i = 1 : 10000
    matrix_result_mid(1) = matrix_result_mid(1) + (rand_num(i) - mean_num)^2;
    matrix_result_mid(2) = matrix_result_mid(2) + (rand_num(i) - mean_num)^3;
    matrix_result_mid(3) = matrix_result_mid(3) + (rand_num(i) - mean_num)^4;
end
matrix_result_mid = matrix_result_mid / 10000;
disp([' �������ľ� = ', num2str(matrix_result_mid(1))]);
disp([' �������ľ� = ', num2str(matrix_result_mid(2))]);
disp([' �Ľ����ľ� = ', num2str(matrix_result_mid(3))]);

%% ����λ��,����,�����Сֵ
mid_num = median(rand_num);
mode_num = mode(rand_num);
max_num = max(rand_num);
min_num = min(rand_num);
disp([' ��λ�� = ', num2str(mid_num)]);
disp([' ���� = ', num2str(mode_num)]);
disp([' ���ֵ = ', num2str(max_num)]);
disp([' ��Сֵ = ', num2str(min_num)]);

%% Ƶ��ֱ��ͼ
figure,subplot(211);
hist(rand_num),title('10 ������ ');
subplot(212);
hist(rand_num,100),title('100 ������ ');
