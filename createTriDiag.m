function [A] = createTriDiag(d, e, f, n)
%�������ԽǾ���A
%[A] = createTriDiag(d, e, f, n)
% d     ϵ������ζԽ���ϵ��(������)
% e     ϵ������Խ���ϵ��(������)
% f     ϵ�����󳬶Խ���ϵ��(������)
% n     A�Ĵ�С
%����ֵ
% A     ���ԽǾ���
    A = zeros(n);
    for i = 1:n
        A(i,i) = e(i);
        if i<n ; A(i,i+1) = f(i); end
        if i>1 ; A(i,i-1) = d(i-1); end
    end
end

