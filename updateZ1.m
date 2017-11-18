function [ Z1new ] = updateZ1(X,y1,B,Z1,U1,A,rho)
    Z1new = zeros(size(Z1,1),size(Z1,2));
    cond = y1-X*B+U1;
    for i = 1:size(Z1,1)
        for j = 1:size(Z1,2)
            if cond(i,j)>A(j)/rho
                Z1new(i,j) = cond(i,j) - A(j)/rho;
            elseif cond(i,j) < (A(j)-1)/rho
                Z1new(i,j) = cond(i,j) -(A(j)-1)/rho;
            elseif cond(i,j) >= (A(j)-1)/rho && cond(i,j) <= A(j)/rho
                Z1new(i,j) = 0;
            end
        end
    end
end 