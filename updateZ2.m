function [ Z2new ] = updateZ2(X,B,Z2,Z3,U2,U3,D)
    Z2new = (X*B+U2+Z3*D-U3*D)*pinv((eye(size(Z2,2))+D'*D));
end

