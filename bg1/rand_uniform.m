function s = rand_uniform(num, arg)
%%����ʾ���� s = randuniform(10000, 1)
% s(n)Ϊnʱ�̵���������� rΪ��չ���� bΪ�̶��Ŷ��� MΪѭ��ģ arg:1~3
% ������ʽ��s(n + 1) = (r * s(n) + b) % M 
% ����matlab�±���������Ϊ�������������޸Ĺ�ʽΪ��s(n) = (r * s(n - 1) + b) % M 
s = zeros(1, num);
r = 2045;
b = 1;
M = 1048576;
temp = clock;
s(1) = mod(sum(temp(arg+3)) * sum(temp(arg+3)), M);
for i = 2 : num
    s(i) = mod(s(i - 1) * r + b, M);
end
s = s / M;
end