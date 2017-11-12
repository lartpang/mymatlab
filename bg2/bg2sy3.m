%% �������������
clear;clc;

%% һЩ��Ӧ�ĺ���
N = 500;
x_t = rand_gause(0, 1, N, 1);%����M��������ʱ�����Ӳ���Ϊ1
figure,plot(x_t);
title('����ź�ʱ����')
h_t = fir1(101, [0.3 0.4]);%101�״�ͨ�˲��������ֽ�ֹƵ��Ϊ0.3��0.4
figure,plot(h_t);
title('�弤��Ӧ����ht');
H_w = fft(h_t, 2 * N);%�˲���Ƶ����Ӧ
figure,plot((1 : N) / N, abs(H_w(1 : N)));
title('���ݺ���Hw');

%% ����ͼ������ M�������������Ĺ�����
S_xx = abs(fft(x_t, 2 * N) .^ 2) / (2 * N);
H_w2 = abs(H_w) .^ 2;%ϵͳ�Ĺ��ʴ��亯��
S_yy = S_xx .* H_w2;%����źŵĹ�����
R_yy = fftshift(ifft(S_yy));%��IFFT������źŵ�����غ���

%% ����ͼ��
R_xx = R_11(x_t);%ֱ�ӷ����ư�����������غ���
figure,stem(R_xx);
title('��������غ���Rxx');
w = (1 : N) / N;%�������ܶȺ�������
t = (-N : N - 1) / N * (N / 20000);%����غ�����������
figure;
subplot(411), plot(w, abs(S_xx(1 : N)));
title(' �����źŵĹ������ܶ� ');
xlabel('��һ��Ƶ��f'),ylabel('Sxx(f)');
subplot(412),plot(w, abs(H_w2(1 : N)));
title(' ϵͳ�Ĺ��ʴ��亯�� ');
xlabel('��һ��Ƶ��f'),ylabel('Hw2(f)');
subplot(413),plot(w, abs(S_yy(1 : N)));
title(' ����źŵĹ������ܶ� ');
xlabel('��һ��Ƶ��f'),ylabel('Syy(f)');
subplot(414),plot(t, R_yy); 
title(' �������������غ��� ');
xlabel('tao'),ylabel('Ryy(tao)');