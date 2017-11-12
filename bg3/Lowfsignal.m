function [ Ac, As ] = Lowfsignal( X, f0, fs )
%Lowfsignal ���ڻ�ò���Ƶ��Ϊfs������Ƶ��Ϊf0��խ�����
%����X(t)�ĵ�Ƶ����  
    HX = imag(hilbert(X));
    [~, N] = size(X);
    t = 0 : 1 / fs : ((N - 1) / fs);
    Ac = X .* cos(2 * pi * f0 * t) + HX .* sin(2 * pi * f0 * t);
    As = HX .* cos(2 * pi * f0 * t) - X .*sin(2 * pi * f0 * t);
end
