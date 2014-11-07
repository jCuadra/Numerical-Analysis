function [X] = Solve_Cholesky(A, b)
%ʹ�øĽ���ƽ��������ⷽ���� Ax=b
%[X] = Solve_Cholesky(A, b)
%   A ������ϵ������
%   b �������Ҷ�ֵ
%����ֵ:
%   X �������Ľ�
[L, D] = Decompose_Cholesky(A);
X = Solve_L(L, b);
X = Solve_U(D*L', X);
end