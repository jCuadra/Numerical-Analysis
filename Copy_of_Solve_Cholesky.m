function [X] = Copy_of_Solve_Cholesky(A, b)
%ʹ��ƽ��������ⷽ���� Ax=b
%[X] = Solve_Cholesky(A, b)
%   A ������ϵ������
%   b �������Ҷ�ֵ
%����ֵ:
%   X �������Ľ�
L = Copy_of_Decompose_Cholesky(A);
X = Solve_L(L, b);
X = Solve_U(L', X);
end