function [k] = Estimate_Matrix_Condition_Mod1(A, m)
%估计矩阵 A 在1范数下的条件数
%[k] = Estimate_Matrix_Condition_Mod1(A, m)
% A     n*n矩阵
% m     精度,最大逼近次数
%返回值
% k 条件数
k = norm(A,1)*Estimate_Reverse_Matrix_Mod1(A, m);
end