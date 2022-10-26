function D = call_simplex (A, b, c)
  m = size(A)(1);
  n = length(A);

  [x, bind] = find_basic_viable_solution(A,b,m,n);
  B = A(:,bind);
  Binv = inv(B);
  D = simplex(A,b,c,m,n,x,bind,Binv);
endfunction
