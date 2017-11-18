function [ Z3new ] = updateZ3(Z2,Z3,U3,D)
    Z3new = zeros(size(Z3,1),size(Z3,2));
    for i = 1:size(Z3,1)
        for j = 1:size(Z3,2)
            cond = Z2*D'+U3;
            Z3new(i,j) = max(cond(i,j),0);
        end
    end
end

