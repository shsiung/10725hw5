function [ val ] = obj_val( Z1,A )
val = 0; 
for i = 1:size(Z1,1)
    for j = 1:size(Z1,2)
        val = val + max(A(j)*Z1(i,j),(A(j)-1)*Z1(i,j));
    end
end
end

