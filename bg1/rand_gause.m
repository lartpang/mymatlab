function s = rand_gause(m, d, num, arg)
%%����ʾ���� s = rand_gause(1, 2, 10000, 1);
% m:��ֵ d:��׼�� num:������ s:���
% arg:ʱ�����Ӳ��� 1~2
x = rand_uniform(num, arg);
y = rand_uniform(num, arg+1);
s = d * sqrt( -2 * log(x)) .* cos(2 * pi * y) + m;
end