function r_11 = R_11(x)
%% 调用示例1：r_11 = R_11(x)
% x: 输入序列
% r_11长度： 2N-1  -->> -N+1~N-1
% 计算依照下式：
%          1   N-1
% Rx(m) = —— sum {x(n) * x(n + m)}
%          N   n=0
%% 程序实现
% 由于自相关函数本身是偶函数，所以说，可以先把m>0的部分求出来
% 再直接赋值给m<0的部分
N = length(x);
r_11 = zeros(1, 2 * N - 1);
for i = 1 : N
    for j = 1 : N + 1 - i
        r_11(N - 1 + i) = r_11(N - 1 + i) + x(j) * x(j + i - 1); 
    end
    r_11(N - 1 + i) = r_11(N - 1 + i) / N;
end
for i = 1 : N - 1
    r_11(i) = r_11(2 * N - i);  
end
end