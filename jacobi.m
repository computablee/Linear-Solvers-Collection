function [r, iters, residual] = jacobi(A, b, max, tolerance)
    s = size(A);
    old = zeros(s(1),1);
    new = ones(s(1),1);

    k = 1;
    while (k < max) && (norm(old - new) > tolerance)
        old = new;
        new = zeros(s(1), 1);
        for i = 1:s
            temp = 0;
            for j = 1:s
                if (i == j)
                    continue;
                end
                temp = temp + (A(i, j) / A(i, i)) * old(j);
            end
            new(i) = -temp + (b(i) / A(i, i));
        end
        disp(new);
        k = k + 1;
    end

    r = new;
    iters = k;
    residual = norm(old - new);
end