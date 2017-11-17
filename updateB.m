function [ Bnew ] = updateB(X,y1,B,Z1,Z2,Z3,U1,U2,U3)
Bnew = 1/2*pinv(X)*(y1 + U1 - U2 + Z2 - Z1);
end

