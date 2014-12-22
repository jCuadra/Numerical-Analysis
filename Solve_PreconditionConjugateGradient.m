function [ X ] = Solve_PreconditionConjugateGradient( A, b, M, x0, e )
%ʹ��Ԥ�Ź����ݶȷ�������Է�����
%[ X ] = Solve_PreconditionConjugateGradient( A, b, M, x0, e )
%   A  �Գ���������
%   b  �������Ҷ�ֵ(������)
%   M  Ԥ�ž���
%   x0 ��ʼ������(������)
%   e  �����
%����ֵ:
%   X ������Ľ�
X = x0';
r = b - A*X;
k = 0;
while sqrt(r'*r)>e
    z = Solve_Gauss(M, r);
    k = k + 1;
    if k > 100000; disp('ConjugateGradient ��������������!'); break; end
    if k == 1
        p = z;
        rou1 = r'*z;
    else
        rou2 = rou1;
        rou1 = r'*z;
        beta = rou1/rou2;
        p = z + beta*p;
    end
    w = A*p;
    alpha = rou1/(p'*w);
    X = X + alpha*p;
    r = r - alpha*w;
end
end

