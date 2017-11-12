function [ Ac, As ] = Lowfsignal( X, f0, fs )
%Lowfsignal 用于获得采样频率为fs、中心频率为f0的窄带随机
%过程X(t)的低频过程  
    HX = imag(hilbert(X));
    [~, N] = size(X);
    t = 0 : 1 / fs : ((N - 1) / fs);
    Ac = X .* cos(2 * pi * f0 * t) + HX .* sin(2 * pi * f0 * t);
    As = HX .* cos(2 * pi * f0 * t) - X .*sin(2 * pi * f0 * t);
end
