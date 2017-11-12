function X = Narrowbandsignal( N, f0, deltf, fs, M )
%NARROWBANDSIGNAL ����խ������ź�
%   ���N��խ������ź������Ĳ���
    N1 = N - M;
    xt = random('norm', 0, 1, [1, N1]);%����N-M����˹�����
    f1 = f0 * 2 / fs;%����ù�һ������Ƶ��
    df1 = deltf / fs;%��һ������
    ht = fir1(M, [f1 - df1 f1 + df1]);
    %htΪ��ͨ�˲����ĳ����Ӧ��MΪ����
    %f1-df1��f1+df1�ֱ�Ϊ�˲����Ĺ�һ����ֹƵ��
    X = conv(xt, ht);%���N��խ������ź������Ĳ���
end