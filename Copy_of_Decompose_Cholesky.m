function [L] = Copy_of_Decompose_Cholesky(A)
%ʹ��ƽ�������Ծ���A���зֽ�
%[L, U] = Decompose_Cholesky(A)
%   A ����
%����ֵ:
%   L ��������
%   D �Խ���Ԫ��                 
n = length(A);
for k = 1:n
    A(k,k) = sqrt(A(k,k));
    A(k+1:n,k) = A(k+1:n,k)/A(k,k);
    for j = k+1:n
        A(j:n,j) = A(j:n,j) - A(j:n,k)*A(j,k);
    end
end
L = tril(A);
end