function [X] = Solve_Chasing(d, e, f, b)
%ʹ��׷�Ϸ���ⷽ���� Ax=b
% d     ϵ������ζԽ���ϵ��(������)
% e     ϵ������Խ���ϵ��(������)
% f     ϵ�����󳬶Խ���ϵ��(������)
% b     �Ҷ�����
%����ֵ
% X     ������Ľ� 
n = length(b);
X = zeros(n,1);
for i = 2:n
    l = d(i-1)/e(i-1);
    e(i) = e(i) - f(i-1)*l;
    b(i) = b(i) - b(i-1)*l;
end
X(n) = b(n)/e(n);
for i=n-1:-1:1
    X(i) = (b(i)-f(i)*X(i+1))/e(i);
end
end