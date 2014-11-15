function [r] = Estimate_Reverse_Matrix_Mod1(A, m)
%���ƾ��� A �����1����
%[r] = Estimate_Reverse_Matrix_Mod1(A, m)
% A     n*n����
% m     ����,���ƽ�����
%����ֵ
% r     ���� A �����1��������ֵ
k = 1;
n = length(A);
x = ones(n,1)/n;
i = 0;
B = A';
while k==1
    w = Solve_Gauss(A,x);
    v = sign(w);
    z = Solve_Gauss(B,v);
    if norm(z,inf) <= z'*x
        r = norm(w,1);
        k = 0;
    else
        j = find(z==max(z));
        x = zeros(n,1);
        x(j(1)) = 1;
        k = 1;
    end
    if i > m
        r = norm(w,1);
        break
    end
    if i > 1000
        disp('WARNING: ����A�����������,�������.')
        break
    end
    i = i + 1;
end
end