function [r] = Estimate_Reverse_Matrix_Modinf(A, m)
%���ƾ��� A ����������
%[r] = Estimate_Reverse_Matrix_Modinf(A, m)
% A     n*n����
% m     ����,���ƽ�����
%����ֵ
% r     ���� A ��������������ֵ
r = Estimate_Reverse_Matrix_Mod1(A', m);
end