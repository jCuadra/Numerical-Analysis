function [X] = Solve_Gauss(A, b)
%ʹ������Ԫ��˹��ȥ����ⷽ���� Ax=b
%[X] = Solve_Gauss(A, b)
%   A ������ϵ������
%   b �������Ҷ�ֵ
%����ֵ:
%   X ������Ľ�
[L, U, P] = LU(A);
X = Solve_L(L, P*b);
X = Solve_U(U, X);
end