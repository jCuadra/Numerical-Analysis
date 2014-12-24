function [ E ] = Solve_Eig_Givens( A, e )
% ʹ���� Hessenberg �ֽ�, Givens �仯��� A ������ֵ
%[ E ] = Solve_Eig_Givens( A )
%   A ����
%   e ����
%����ֵ
%   E ���������Ǿ���

n = length(A);
for k = 1:n-2
    [v,b] = Solve_Householder(A(k+1:n,k));
    H = eye(n-k) - b*v'*v;
    A(k+1:n,k:n) = H*A(k+1:n,k:n);
    A(1:n,k+1:n) = A(1:n,k+1:n)*H;
end
C = Get_Tril(A,n);
E = Special_Givens(A,n);
c = Get_Tril(E,n);
k = 0;
while norm(C-c,Inf)>e
    k = k + 1;
    if k>50000; disp('Givens �������ֵ�������������������!'); break; end
    C = c;
    E = Special_Givens(E,n);
    c = Get_Tril(E,n);
end

end

function [ B ] = Special_Givens( A, n )
    B = eye(n);
    for i = 1:n-1
        [c,s] = Solve_Givens(A(i,i), A(i+1,i));
        D = eye(n);
        D(i,i) = c;
        D(i,i+1) = s;
        D(i+1,i) = -s;
        D(i+1,i+1) = c;
        B = D*B;
        A = D*A;
    end
    B = A*B';
end

function [c] = Get_Tril( A, n )
    c = zeros(n-1,1);
    for i = 1:n-1
        c(i) = A(i+1,i);
    end
end
