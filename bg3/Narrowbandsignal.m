function X = Narrowbandsignal( N, f0, deltf, fs, M )
%NARROWBANDSIGNAL 生成窄带随机信号
%   输出N个窄带随机信号样本的采样
    N1 = N - M;
    xt = random('norm', 0, 1, [1, N1]);%产生N-M个高斯随机数
    f1 = f0 * 2 / fs;%设计用归一化中心频率
    df1 = deltf / fs;%归一化带宽
    ht = fir1(M, [f1 - df1 f1 + df1]);
    %ht为带通滤波器的冲击响应，M为阶数
    %f1-df1和f1+df1分别为滤波器的归一化截止频率
    X = conv(xt, ht);%输出N个窄带随机信号样本的采样
end