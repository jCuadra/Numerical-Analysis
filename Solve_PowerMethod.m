function [ lamda, X ] = Solve_PowerMethod( A, e )
%ʹ���ݷ��� A �������ֵ
%   A ��Ҫ���ľ���
%   e ����
%����ֵ
%   lamda   �������ֵ
%   X       �������ֵ��Ӧ������

n = length(A);
x = rand(n,1);
x(1) = 1; j = 1; k = 0;
X = A*x;
while norm(X-x)>e
    if k > 10000; disp('��������������,�ݷ�����������.'); break; end
    k = k + 1;
    y = A*X;
    m = -Inf;
    for i = 1:n ; if m<y(i); m = y(i);j = i; end; end;
    x = X;
    X = y/m;
end
lamda = A(j,:)*X/X(j);
end

