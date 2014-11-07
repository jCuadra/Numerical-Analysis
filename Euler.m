function [ ret ] = Euler( f, x0, y0, xn, n )
%ŷ��������ֵ����
%[ ret ] = Euler( f, x0, y0, xn, n )
%   f  ���ֺ���
%   x0 ������ʼ��
%   y0 ������ʼֵ
%   xn ������ֹ��
%   n  ���ַ���(����)
%����ֵ
%   ret [ x0 y0; x1 y1; ...; xn yn;]
    ret = zeros(n+1,2);
    h = (xn - x0)/n;
    ret(1,2) = y0; 
    ret(:,1) = (x0:h:xn)';
    for i = 2:n+1
        ret(i,2) = ret(i-1,2) + h*f(ret(i-1,1),ret(i-1,2));
    end
end

