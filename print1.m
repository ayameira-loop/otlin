function print1(c, x, bind, nind, xB, cbarra)
  # 1. os  ́ındices das vari ́aveis b ́asicas e os respectivos valores das vari ́aveis b ́asica
  for i = 1:columns(bind)
    printf("%d   %f\n", bind(i), xB(i));
  endfor

  # 2. o valor da fun ̧c ̃ao objetivo na solu ̧c ̃ao atual
  printf("\nValor da função objetivo: %f\n\n", c'*x)

  # 3. os  ́ındices e os custos reduzidos das vari ́aveis n ̃ao b ́asicas;
  printf("Custos reduzidos:\n");
  for i = nind
    printf("%d   %f\n", i, cbarra(i));
  endfor

endfunction
