function [x, iters, residual] = gauss_seidel(A, b, max, tolerance)
    s = size(A);
    old = zeros(s(1),1);
    new = ones(s(1),1);

    k = 0;
    while (k < max) && (norm(old - new) > tolerance)
        old = new;
        new = zeros(s(1), 1);
        for i = 1:s
            temp = 0;
            for j = 1:(i - 1)
                temp = temp + A(i, j) / A(i, i) * new(j);
            end
            for j = (i + 1):s
                temp = temp + (A(i, j) / A(i, i)) * old(j);
            end
            new(i) = -temp + (b(i) / A(i, i));
        end
        k = k + 1;
    end

    x = new;
    iters = k;
    residual = b - A * x;
end