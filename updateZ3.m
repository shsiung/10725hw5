function [ Z3new ] = updateZ3(X,y1,B,Z1,Z2,Z3,U1,U2,U3,A,D)
    Z3new = zeros(size(Z3,1),size(Z3,2));
    for i = size(Z3,1)
        for j = size(Z3,2)
            if Z3(i,j)>0
                Z3new(i,j) = Z1(i,j)-A(j);
            else
                tempZ3 = Z2*D'+U3;
                Z3new(i,j) = tempZ3(i,j);
            end
        end
    end
end

