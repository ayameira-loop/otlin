A = [ 1 -2 1 0;
     -1 1 0 1];
b = [4;3];
c = [-1;-3;0;0];
x = [0;0;4;3];
bind = [3 4];
m = size(A)(1);
n = length(A);
B = A(:,bind);
Binv = inv(B);
D = simplex(A,b,c,m,n,x,bind,Binv);
