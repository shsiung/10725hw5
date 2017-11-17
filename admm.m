clear;
%% Reading in data
X = csvread('X.csv');
y = csvread('y.csv');

%% Setting parameters
rho = 1;
iter = 50;
A = [0.1,0.5,0.9]';

n = size(X,1);
p = size(X,2);
r = length(A);

Z1 = zeros(n,r);
Z2 = zeros(n,r);
Z3 = zeros(n,r-1);
B = zeros(p,r);
U1 = zeros(n,r);
U2 = zeros(n,r);
U3 = zeros(n,r-1);
D = [-1, 1, 0;
     0, -1, 1];
y1 = repmat(y,1,r);
curr_best = 999;
for i = 1 : iter
    B = updateB(X,y1,B,Z1,Z2,Z3,U1,U2,U3); 
    Z1 = updateZ1(X,y1,B,Z1,Z2,Z3,U1,U2,U3,A); 
    Z2 = updateZ2(X,y1,B,Z1,Z2,Z3,U1,U2,U3,A,D);
    Z3 = updateZ3(X,y1,B,Z1,Z2,Z3,U1,U2,U3,A,D);
    U1 = U1 + y1-X*B-Z1;
    U2 = U2 + X*B-Z2;
    U3 = U3+Z2*D'-Z3;
    g = 0;  
    
    val(i) = obj_val(Z1,A);
    if (val(i) < curr_best)
        curr_best =val(i);
    end
    
end
val
fprint('Best objective: %f', curr_best);
