function [ X ] = Solve_QR( A, b )
%ʹ��QR�ֽⷨ��ⳬ�����Է�����
%[ X ] = Solve_QR( A, b )
%   A  ����������ϵ������
%   b  �������Ҷ�ֵ(������)
%����ֵ:
%   X ������Ľ�
[Q, R] = Decompose_QR(A);
X = Solve_U(R, Q'*b);

end

