function [x, iters, residual] = cg(A, b, max, tolerance)
    k = 0;
    s = size(A);
    x = zeros(s(1), 1);
    r = b - A * x;
    delta = innerprod(A, r, r);
    deltaold = 0;

    while sqrt(delta) > tolerance * sqrt(innerprod(A, b, b)) && k < max
        k = k + 1;
        if k == 1
            p = r;
        else
            beta = delta / deltaold;
            p = r + beta * p;
        end
        w = A * p;
        alpha = delta / innerprod(A, p, w);
        x = x + alpha * p;
        r = r - alpha * w;
        deltaold = delta;
        delta = innerprod(A, r, r);
    end

    iters = k;
    residual = r;
end

function i = innerprod(A, v, u)
    i = transpose(v) * A * u;
end