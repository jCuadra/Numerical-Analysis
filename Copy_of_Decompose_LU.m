function [L, U, P] = Copy_of_Decompose_LU(A)
%ʹ��Gauss������LU����ֽ�
%   A ����
%[L, U, P] = Decompose_LU(A)
%����ֵ:
%   L �����Ǿ���
%   U �����Ǿ���,��Խ�����Ϊ D
%   P �û�����
n = length(A);
P = eye(n);
L = zeros(n);
U = zeros(n);
for k = 1:n-1
    if A(k,k) ~= 0
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
    else
        disp('����A���죡')
        pause
    end
end
for i = 1:n
    for j = 1:n
        if i>j
            L(i,j) = A(i,j);
        else
            U(i,j) = A(i,j);
        end
    end
end
L = L + eye(n);
end
