function [L, D] = Decompose_Cholesky(A)
%ʹ�øĽ�ƽ�������Ծ���A���зֽ�
%[L, U] = Decompose_Cholesky(A)
%   A ����
%����ֵ:
%   L ��������
%   D �Խ���Ԫ��
n = length(A);
d = zeros(1,n);
L = eye(n);
d(1) = A(1,1);
A(2:n,1) = A(2:n,1)/d(1);
L(2:n,1) = A(2:n,1);
for j = 2:n
    for i = 1:j-1
        v(i) = A(j,i)*A(i,i);
    end
    A(j,j) = A(j,j) - A(j,1:j-1)*v(1:j-1)';
    A(j+1:n,j) = (A(j+1:n,j) - A(j+1:n,1:j-1)*v(1:j-1)')/A(j,j);
    L(j+1:n,j) = A(j+1:n,j);
    d(j) = A(j,j);
end
D = diag(d,0);
end