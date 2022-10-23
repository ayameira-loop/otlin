function print2(j, d, theta, l, bind)

  # 4. o  ́ındice da vari ́avel que entra na base;
  printf("\nEntra na base: %d\n", j);

  # 5. os  ́ındices das vari ́aveis que estavam na base e os respectivos valores das componentes do vetor de dire ̧c ̃ao;
  printf("\nDireção:\n");
  for i = bind
    printf("%d   %f\n", i, d(i));
  endfor

  # 6. o valor de θ∗;
  printf("\nTheta*: %f\n", theta);

  # 7. o  ́ındice da vari ́avel que sai da base
  printf("\nSai da base: %d\n", l);

endfunction
