function [ Bnew ] = updateB(X,y1,Z1,Z2,U1,U2)
Bnew = 1/2*pinv(X)*(y1 + U1 - U2 + Z2 - Z1);
end

