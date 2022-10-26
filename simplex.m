function [x, bind, Binv, ind, v] = simplex(A,b,c,m,n,x,bind,Binv)
  if (rank(A) < m)
    error("Não existem %d colunas linearmente independentes na matriz A", m);
  endif
  if (! is_basic_viable_solution(A, x, b))
    error("x inicial não é solução viável básica");
  endif
  maxIterations = 1000;
  iteration = 0;
  ind = 1;
  while (ind == 1 && iteration < maxIterations)
    printf("\nIterando %d\n\n", iteration);
    [x, bind, Binv, ind, v] = simplex_iter(A,b,c,m,n,x,bind,Binv);
    iteration = iteration + 1;
  endwhile
  return
endfunction
