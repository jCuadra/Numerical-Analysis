function [ lamda, X ] = Solve_BackwardPowerMethod( A, u, e )
%ʹ�÷��ݷ��� A ������ֵ���� u ���������ֵ����Ӧ����
%   A ��Ҫ���ľ���
%   u ����ֵ
%   e ����
%����ֵ
%   lamda   ����ֵ
%   X       ����ֵ��Ӧ������

n = length(A);
x = rand(n,1);
x(1) = 1; j = 1; k = 0;

% ����LU�ֽ�
[L, U, P] = Decompose_LU(A-u*eye(n));

Pn = 10;
Pool = zeros(n,Pn);
Pool(:,Pn) = Solve_L(L, P*x);
Pool(:,Pn) = Solve_U(U, Pool(:,Pn));
exit_flag = 0;

while norm(Pool(:,Pn)-Pool(:,1))>e && ~exit_flag
    if k > 10000; disp('��������������,���ݷ����ܲ�����.'); break; end
    Pool(:,1) = Pool(:,Pn);
    for i = 2:Pn
        Pool(:,i) = find_next(Pool(:,i-1), L, U, P, n);
        if norm(Pool(:,i)-x)<e; exit_flag = 1;break; end
    end
    k = k + Pn;
end

X = Pool(:,Pn);
m = -Inf;
for i = 1:n ; if m<X(i); m = X(i);j=i; end; end;
lamda = A(j,:)*X/X(j);
X = X./norm(X);

end

function [X]=find_next(x, L, U, P, n)
    y = Solve_L(L, P*x);
    y = Solve_U(U, y);
    m = -Inf;
    for i = 1:n ; if m<y(i); m = y(i); end; end;
    X = y/m;
end