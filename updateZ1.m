function [ Z1new ] = updateZ1(X,y1,B,Z1,Z2,Z3,U1,U2,U3,A)
    Z1new = zeros(size(Z1,1),size(Z1,2));
    for i = size(Z1,1)
        for j = size(Z1,2)
            if Z1(i,j)>A(j)
                Z1new(i,j) = Z1(i,j)-A(j);
            else if Z1(i,j) < -(A(j)-1)
                    Z1new(i,j) = Z1(i,j)-(A(j)-1);
                else 
                    Z1new(i,j) = 0;
                end
            end
        end
    end
end

