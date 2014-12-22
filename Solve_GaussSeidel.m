function [ X ] = Solve_GaussSeidel( A, b, x0, e )
%ʹ�ø�˹-���¶�������������Է�����
%[ X ] = Solve_GaussSeidel( A, b, x0, e )
%   A  ϵ������
%   b  �������Ҷ�ֵ(������)
%   x0 ��ʼ������(������)
%   e  �����
%����ֵ:
%   X ������Ľ�
    n = length(A);
    [L, D, U] = ToLDU(A, n);
    M = (D-L)\U;
    g = (D-L)\b;
    x = x0';
    X = M*x + g;
    k = 0;
    while norm(X-x, 2)>e
        k = k + 1;
        if k > 100000; disp('GaussSeidel ������������������!');break;  end
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

