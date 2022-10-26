function [x, bind] = find_basic_viable_solution(A,b,m,n)
  if (rank(A) < m)
    error("Não existem %d colunas linearmente independentes na matriz A", m);
  endif
  combinations = nchoosek(1:n, m);
  for i = 1:length(combinations)
    bind = combinations(i, :);
    B = A(:,bind);
    if (rank(B) != m)
      continue;
    endif

    x_temp = B \ b;
    x = zeros(n, 1);
    x(bind) = x_temp;

    if (! is_basic_viable_solution(A, x, b))
      continue;
    endif

    return;
  endfor
  error("Não foi encontrada solução viável básica inicial");
endfunction
