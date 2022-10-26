function print_optimal_solution(x, c)
  printf("Solução ótima encontrada com custo %f:\n\n", c'*x)

  for i = 1:rows(x)
    printf("%d   %f\n", i, x(i));
  endfor
endfunction
