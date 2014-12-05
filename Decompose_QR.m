function [ Q, R ] = Decompose_QR( A )
%ʹ��QR�����о���ֽ�
%[ Q, R ] = Decompose_QR( A )
%   A m*n����(m>=n)
%����ֵ:
%   [Q,R] A=QR
    [m,n] = size(A);
    Q = eye(m);
    R = zeros(m,n);
    for j = 1:n
        if j < m
            [v, b] = Solve_Householder(A(j:m, j));
            H = eye(m-j+1) - b*v'*v;
            A(j:m, j:n) = H*A(j:m, j:n);
            Q = Q*create_H(H, j, m);
        end
        R(j,j:n) = A(j, j:n);
    end
end

function [H] = create_H(A, j, m)
    H = eye(m);
    H(j:m,j:m) = A;
end
