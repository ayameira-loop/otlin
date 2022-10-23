A = [1 1 1 1;
     2 0 3 4];
b = [2;2];
c = [2;0;0;0];
x = [1; 1; 0; 0];
m = 2;
n = 4;
bind = [1, 2];
B = A(:,bind);
Binv = inv(B);

D = simplex_iter(A,b,c,m,n,x,bind,Binv)
