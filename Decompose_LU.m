function [L, U, P] = Decompose_LU(A)
%ʹ������Ԫ������LU����ֽ�
%   A ����
%[L, U, P] = Decompose_LU(A)
%����ֵ:
%   L �����Ǿ���
%   U �����Ǿ���,��Խ�����Ϊ D
%   P �û�����
n = length(A);
P = eye(n);
L = eye(n);
U = zeros(n);
for k = 1:n-1
    p = max(abs(A(k:n,k)));
    p = find(A(k:n,k)==p(1));
    p = p(1) + k - 1;
    if p~= k
        A(k,:) = A(k,:) + A(p,:);
        A(p,:) = A(k,:) - A(p,:);
        A(k,:) = A(k,:) - A(p,:);
        % ͬʱ����P
        P(k,:) = P(k,:) + P(p,:);
        P(p,:) = P(k,:) - P(p,:);
        P(k,:) = P(k,:) - P(p,:);
    end
    if A(k,k) ~= 0
        L(k+1:n,k) = A(k+1:n,k)/A(k,k);
        U(k,k:n) = A(k,k:n);
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - L(k+1:n,k)*A(k,k+1:n);
    else
        disp('����A����!')
        pause
    end
end
U(n,n) = A(n,n);
end