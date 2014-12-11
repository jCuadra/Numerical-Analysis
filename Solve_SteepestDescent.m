function [ X ] = Solve_SteepestDescent ( A, b, x0, e )
%ʹ�������½���������Է�����
%[ X ] = Solve_SteepestDescent ( A, b, x0, e )
%   A  �Գ���������
%   b  �������Ҷ�ֵ(������)
%   x0 ��ʼ������(������)
%   e  �����
%����ֵ:
%   X ������Ľ�
    X = x0';
    r = b - A*X;
    while norm(r, inf)>e
        X = X + (r'*r)/(r'*A*r)*r;
        r = b - A*X;
    end
end

