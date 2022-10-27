matrixSize = 4;

A = rand(matrixSize, matrixSize);

while rank(A) < matrixSize
    A = rand(matrixSize, matrixSize);
end

A = transpose(A) * A;

b = rand(matrixSize, 1);

[x, iters, residual] = cg(A, b, 10, 0.000001);
fprintf("Took %d iterations\n", iters);
disp("Residual:")
disp(residual);
disp("A:");
disp(A);
disp("x:");
disp(x);
disp("Solution");
disp(A \ b);