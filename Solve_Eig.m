function [ E, I ] = Solve_Eig( A, e )
% ��� A ������ֵ
%[ E, I ] = Solve_Eig( A )
%   A ����
%   e ����
%����ֵ
%   E ����ֵ������
%   I ����ֵ�Խ���(��E�ж�Ӧ)
if A' == A
    [E,I] = Solve_Eig_Givens_Symmetric(A,e);
else
    [E,I] = Solve_Eig_Givens(A,e);
end
end