%% �����ǰ���ݻ����Լ������д��ڵ���ʾ
clear;clc;

%% ������˹�����
rand_num_x = rand_gause(1, sqrt(2), 10000, 1);
subplot(2, 1 ,1);
plot(rand_num_x),title(' �����ĸ�˹����� x ');

rand_num_y = rand_gause(3, 2, 10000, 2);
subplot(2, 1 ,2);
plot(rand_num_y),title(' �����ĸ�˹����� y ');

%% ���x����غ���
N = 10000;
figure;
Rx = R_11(rand_num_x);
subplot(221),plot(Rx);
axis([N-10 N+10 0 5]),title('x�������');
[Rx, l] = xcorr(rand_num_x, 'biased');
subplot(222),plot(l, Rx);
axis([-10 10 0 5]),title('x�������');

%% ���y����غ���
Ry = R_11(rand_num_y); 
subplot(223),plot(Ry);
axis([N-10 N+10 0 20]),title('y�������');
[Ry, m] = xcorr(rand_num_y, 'biased'); 
subplot(224),plot(m, Ry);
axis([-10 10 0 20]),title('y�������');

%% ���x,y����غ���
[Rxy, n] = xcorr(rand_num_x, rand_num_y, 'biased');
figure,plot(n, Rxy);
axis([-10 10 0 5]),title('x,y�Ļ����');