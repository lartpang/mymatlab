%% 准备环境
clear; clc;

%% 生成正弦信号
N = 20000; % 20000点
f = 1000; % 频率1000Hz
fs = 16000; % 采样率16000Hz
data_sin = sin(2 * pi * f / fs * (1 : N));
figure, plot(data_sin(1 : 99));
title('20000点正弦信号1000Hz，采样率16000Hz');

%% 1: 时域变换卷积
step = 20000;
h = zeros(1, step);
for i = 1 : step
    cul = i - step / 2;
    ind = bitand(abs(cul), 1);
    %按位与，偶数二进制结尾是0，奇数为1
    if(ind == 1);%abs(cul)为奇数
        h(i) = 2 / pi / cul;
        %左右各一半，正负皆有
    end
end
figure, stem(h(9950 : 10049)), title('时域冲激响应');

%% 时域变换卷积运算得到cos数据
data_cos = conv(data_sin, h, 'same');
figure, plot(data_cos(1 : 99), 'r');
title('时域变换卷积运算得到cos数据')

%% 时域方法数据校验
[c, l] = xcorr(data_sin, data_cos, 'coeff');
figure, stem(l, c), axis([9950 10050 -1 1]);
title('时域变换卷积运算数据校验 正余弦信号互相关函数序列')
[~, indx] = max(c);
D = abs(indx - N) + 1

figure, plot(data_sin), hold on
plot(data_cos, 'r');
axis([0 100 -1.5 1.5]);
title('变换前后数据对比')
legend('变换前', '变换后')

%% 计算相位差
[~, I] = find(data_sin == 1);
T = I(2) - I(1)
delta = D / T;
disp(['相位差为：', num2str(delta * 2), 'pi'])

%% 2：频域变换乘积
% 频域传输函数
H = zeros(1, N);
for p = 1 : N
    if(p <= N / 2)
        H(p) = -1i;
    else
        H(p) = 1i;
    end
end
figure, stem(imag(H)), axis([9950 10050 -1 1]);
title('频域冲激响应')

data_cos = real(ifft(fft(data_sin) .* H));
figure;
subplot(211), plot(data_sin(1 : 99)), hold on
title('频域变换原函数sin数据')
subplot(212), plot(data_cos(1 : 99), 'r')
title('频域变换乘积得到cos数据')

%% 频域方法数据校验

[c, l] = xcorr(data_sin, data_cos, 'coeff');
figure, stem(l,c), axis([9950 10050 -1 1]);
title('频域方法数据校验 正余弦信号互相关函数序列')
[~, indx] = max(c);
D = abs(indx - N)

figure, plot(data_sin), hold on
plot(data_cos, 'r')
axis([0 100 -1.5 1.5]);
title('变换前后数据对比')
legend('变换前','变换后')

[~, I] = find(data_sin == 1);
T = I(4) - I(3)
delta = D / T;
disp(['相位差为：', num2str(delta * 2), 'pi'])

%% 3.对比内置函数 hilbert
data_cos = imag(hilbert(data_sin));
figure, plot(data_cos(1 : 99), 'r')
title('内置函数 hilbert变换数据')

%% 内置函数 hilbert方法数据校验
[c, l] = xcorr(data_sin, data_cos, 'coeff');
figure, stem(l,c), axis([9950 10050 -1 1]);
title('内置函数 hilbert 数据校验 正余弦信号互相关函数序列')
[m, indx] = max(c);
D = abs(indx - N)

figure; 
plot(data_sin); hold on
plot(data_cos, 'r')
axis([0 100 -1.5 1.5]);
title('变换前后数据对比')
legend('变换前','变换后')

[~, I] = find(data_sin == 1);
T = I(2) - I(1)
delta = D / T;
disp(['相位差为：', num2str(delta * 2), 'pi'])