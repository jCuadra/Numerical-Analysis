function [X] = Solve_U(U, b)
%ʹ�ûش�������������η�����
%[X] = Solve_U(U, b)
%   U �������ξ���
%   b �������Ҷ�ֵ
%����ֵ:
%   X ������Ľ�
n = length(U);
for j = n:-1:2
    b(j) = b(j)/U(j,j);
    b(1:j-1) = b(1:j-1) - b(j)*U(1:j-1,j);
end
b(1) = b(1)/U(1,1);
X = b;
end