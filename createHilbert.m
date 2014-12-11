function [A] = createHilbert(n)
%����n��Hilbert����
%[A] = createHilbert(n)
    A = zeros(n,n);
    for i = 1:n
        for j  = i:n
            A(i,j) = 1/(i+j-1);
            A(j,i) = A(i,j);
        end
    end
end