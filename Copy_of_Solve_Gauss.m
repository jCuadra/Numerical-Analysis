function [X] = Copy_of_Solve_Gauss(A, b)
%ʹ�ø�˹��ȥ����ⷽ���� Ax=b
%[X] = Copy_of_Solve_Gauss(A, b)
%   A ������ϵ������
%   b �������Ҷ�ֵ
%����ֵ:
%   X ������Ľ�
[L, U, P] = Copy_of_Decompose_LU(A);
X = Solve_L(L, P*b);
X = Solve_U(U, X);
end