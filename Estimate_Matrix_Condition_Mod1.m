function [k] = Estimate_Matrix_Condition_Mod1(A, m)
%���ƾ��� A ��1�����µ�������
%[k] = Estimate_Matrix_Condition_Mod1(A, m)
% A     n*n����
% m     ����,���ƽ�����
%����ֵ
% k ������
k = norm(A,1)*Estimate_Reverse_Matrix_Mod1(A, m);
end