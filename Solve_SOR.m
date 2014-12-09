function [ X ] = Solve_SOR( A, b, x0, w, e )
%ʹ�ó��ɳڵ�����������Է�����
%[ X ] = Solve_SOR( A, b, x0, w, e )
%   A  ϵ������
%   b  �������Ҷ�ֵ(������)
%   x0 ��ʼ������(������)
%   w  �ɳ�����(0-2)
%   e  �����
%����ֵ:
%   X ������Ľ�
    n = length(A);
    [L, D, U] = ToLDU(A, n);
    M = (D-w*L)\((1-w)*D+w*U);
    g = w*((D-w*L)\b);
    x = x0';
    X = M*x + g;
    k = 0;
    while norm(X-x, inf)>e
        k = k + 1;
        if k > 100000; disp('SOR ������������������!');break;  end
        x = X;
        X = M*x + g;
    end
end

function [L, D, U] = ToLDU(A, n)
    L = zeros(n);
    D = zeros(n);
    U = zeros(n);
    for i = 1:n
        L(i,1:i-1) = -A(i,1:i-1);
        D(i,i) = A(i,i);
        U(i,i+1:n) = -A(i,i+1:n);
    end
end
