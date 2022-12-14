matrixSize = 4;

A = [-2 1 0 0 ; 1 -2 1 0 ; 0 1 -2 1 ; 0 0 1 -2];

b = rand(matrixSize, 1);

[x, iters, residual] = jacobi(A, b, 100, 0.000001);
fprintf("Took %d iterations\n", iters);
disp("Residual:")
disp(residual);
disp("A:");
disp(A);
disp("x:");
disp(x);
disp("Solution");
disp(A \ b);