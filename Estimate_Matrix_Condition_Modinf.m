function [k] = Estimate_Matrix_Condition_Modinf(A, m)
%���ƾ��� A ��������µ�������
%[k] = Estimate_Matrix_Condition_Modinf(A, m)
% A     n*n����
% m     ����,���ƽ�����
%����ֵ
% k ������
k = norm(A,inf)*Estimate_Reverse_Matrix_Modinf(A, m);
end