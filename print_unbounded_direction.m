function print_unbounded_direction(u,bind)
  printf("\nO custo ótimo é -inf!\n\n");
  cont=1;
  printf("Direção:\n");
  for i = bind
    printf("%d   %f\n", i, -u(cont));
    cont=cont+1;
  endfor
endfunction
