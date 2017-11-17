function [ Z2new ] = updateZ2(X,y1,B,Z1,Z2,Z3,U1,U2,U3,A,D)
    Z2new = (X*B+U2+Z3*D-U3*D)*(eye(size(Z2,2))+D'*D);
end

