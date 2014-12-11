function [ X ] = Solve_ConjugateGradient( A, b, x0, e )
%ʹ�ù����ݶȷ�������Է�����
%[ X ] = Solve_ConjugateGradient( A, b, x0, e )
%   A  �Գ���������
%   b  �������Ҷ�ֵ(������)
%   x0 ��ʼ������(������)
%   e  �����
%����ֵ:
%   X ������Ľ�
X = x0';
r = b - A*X;
rou1 = r'*r;
k = 0;
while sqrt(rou1)>e
    k = k + 1;
    if k > 100000; disp('ConjugateGradient ��������������!'); break; end
    if k == 1
        p = r;
    else
        beta = rou1/rou2;
        p = r + beta*p;
    end
    w = A*p;
    alpha = rou1/(p'*w);
    X = X + alpha*p;
    r = r - alpha*w;
    rou2 = rou1;
    rou1 = r'*r;
end
end

