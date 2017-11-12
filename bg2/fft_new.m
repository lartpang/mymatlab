function fft_num = fft_new(x)
%% 调用示例：fft_num = fft_new(X);
% 求取傅里叶变换
%         N
% X(k) = sum  x(n)*exp(-j*2*pi*(k-1)*(n-1)/N), 1 <= k <= N.
%        n=1
N = length(x);
fft_num = zeros(1, N);
for k = 1 : N
    for n = 1 : N
       fft_num(k) = fft_num(k) + x(n) * exp(-1i * 2 * pi * (k - 1) * ...
           (n - 1) / N); 
    end
end
end