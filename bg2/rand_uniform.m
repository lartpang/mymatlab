function s = rand_uniform(num, arg)
%%调用示例： s = randuniform(10000, 1)
% 求取均匀随机数
% 其中， s(n)为n时刻的随机数种子 r为扩展因子 b为固定扰动项 M为循环模 arg 1~3
% 参数常用取值为 s(0) = 12357 ，r = 2045 ，b = 1 ，M = 1048576。
% 迭代公式：s(n + 1) = (r * s(n) + b) % M 
% 由于matlab下标索引必须为正整数，所以修改公式为：s(n) = (r * s(n - 1) + b) % M 
s = zeros(1, num);
r = 2045;
b = 1;
M = 1048576;
temp = clock;
s(1) = mod(sum(temp(2 : arg+3)) * sum(temp(1 : arg+3)), M);
for i = 2 : num
    s(i) = mod(s(i - 1) * r + b, M);
end
s = s / M;
end