function s = rand_gause(m, d, num, arg)
%%调用示例： s = rand_gause(1, 2, 10000, 1);
% m:均值 d:标准差 num:数据量 s:输出
% arg:时间种子参数 1~2
x = rand_uniform(num, arg);
y = rand_uniform(num, arg+1);
s = d * sqrt( -2 * log(x)) .* cos(2 * pi * y) + m;
end