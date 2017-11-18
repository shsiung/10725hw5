clear;
close all;
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
y1 = repmat(y,1,r);

Z1 = zeros(n,r);
Z2 = zeros(n,r);
Z3 = zeros(n,r-1);
B =  zeros(p,r);
U1 = zeros(n,r);
U2 = zeros(n,r);
U3 = zeros(n,r-1);
D = [-1, 1, 0;
     0, -1, 1];
curr_best = 999;

for i = 1 : iter
    val(i) = obj_val(y1-X*B,A);
    if (val(i) < curr_best)
        curr_best = val(i);
    end
    B =  updateB(X,y1,Z1,Z2,U1,U2); 
    Z1 = updateZ1(X,y1,B,Z1,U1,A,rho); 
    Z2 = updateZ2(X,B,Z2,Z3,U2,U3,D);
    Z3 = updateZ3(Z2,Z3,U3,D);
    U1 = U1 + y1-X*B-Z1;
    U2 = U2 + X*B-Z2;
    U3 = U3 + Z2*D'-Z3;
end
fprintf('Best objective: %f\n', curr_best);
plot(val)

figure
plot(X(:,1),y,'b.','MarkerSize',10)
hold on;
x_pt = [min(X(:,1)),max(X(:,1))];
plot(x_pt,[-B(1,1)+B(2,1);B(1,1)+B(2,1)],'r-','LineWidth',2);
plot(x_pt,[-B(1,2)+B(2,2);B(1,2)+B(2,2)],'k-','LineWidth',2);
plot(x_pt,[-B(1,3)+B(2,3);B(1,3)+B(2,3)],'g-','LineWidth',2);