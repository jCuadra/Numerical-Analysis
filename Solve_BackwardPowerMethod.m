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

X = Solve_L(L, P*x);
X = Solve_U(U, X);

while norm(X-x)>e
    if k > 10000; disp('��������������,���ݷ�����������.'); break; end
    k = k + 1;
    y = Solve_L(L, P*X);
    y = Solve_U(U, y);
    m = -Inf;
    for i = 1:n ; if m<y(i); m = y(i);j = i; end; end;
    x = X;
    X = y/m;
end
lamda = A(j,:)*X/X(j);
end

