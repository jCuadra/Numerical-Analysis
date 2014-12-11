function [ X ] = Solve_GaussSeidel( A, b, x0, e )
%使用高斯-赛德尔迭代法求解线性方程组
%[ X ] = Solve_GaussSeidel( A, b, x0, e )
%   A  系数矩阵
%   b  方程组右端值(列向量)
%   x0 初始迭代点(行向量)
%   e  误差限
%返回值:
%   X 方程组的解
    n = length(A);
    [L, D, U] = ToLDU(A, n);
    M = (D-L)\U;
    g = (D-L)\b;
    x = x0';
    X = M*x + g;
    k = 0;
    while norm(X-x, 2)>e
        k = k + 1;
        if k > 100000; disp('GaussSeidel 超过最大允许迭代次数!');break;  end
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

