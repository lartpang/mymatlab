function [ At, Ph, A2 ] = EnvelopPhase( X, f0, fs )
%ENVELOPPHASE ����At��Ph��A2(����A(t)����λfai(t)�Ͱ���ƽ��������)
    HX = imag(hilbert(X));
    [~, N] = size(X);
    t = 0 : 1 / fs : ((N - 1) / fs);
    Ac = X .* cos(2 * pi * f0 * t) + HX .* sin(2 * pi * f0 * t);
    As = HX .* cos(2 * pi * f0 * t) - X .*sin(2 * pi * f0 * t);
    Ph = atan(As ./ Ac);
    A2 = Ac .* Ac + As .* As;
    At = sqrt(A2);
end

