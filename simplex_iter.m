function [x, bind, Binv, ind, v] = simplex_iter(A,b,c,m,n,x,bind,Binv)
  precision = 0.00000001;

  xB = x(bind);
  nind = [1:n];
  for i = bind
    nind = nind(nind~=i);
  endfor
  v = -1;
  ind = -1;
  # calcula o custo reduzido: cbarra
  cB = c(bind);
  cbarra = c' - cB' * Binv * A;

  print1(c, x, bind, nind, xB, cbarra)

  # se não houver cbarra_j < 0, estamos em ponto ótimo e paramos
  if (! any(cbarra + precision < 0))
    print_optimal_solution(x, c);
    v = x;
    ind = 0;
    return;
  endif

  # se houver, procuramos j, tq cbarra_j seja o primeiro negativo
  cont = 1;
  for i = cbarra
    if (i<0 && abs(i) > precision)
      j = cont;
      break;
    endif
    cont = cont + 1;
  endfor

  # encontramos a direção
  u = Binv * A(:,j);

  # se nenhuma componente de u for positiva, então theta = inf e o custo ótimo é -inf. paramos
  if (! any(u > 0))
    print_unbounded_direction(u,bind)
    v = u;
    ind = -1;
    return;
  endif

  # calculamos theta: para cada ui > 0, queremos que theta = min{ xB(i)/ui }
  # seja l o índice que satisfaz este theta
  l = 1;
  min = Inf;
  for cont = 1:length(u)
    if (u(cont) < 0 + precision)
      continue;
    endif
    r = xB(cont)/u(cont);
    if (r < min)
      min = r;
      l = cont;
    endif
  endfor
  theta=min;

  # atualizamos x
  d = zeros(n, 1);
  d(j) = 1;
  d(bind) = -u;
  x = x + d*theta;

  print2(j, d, theta, bind(l), bind);

  # substituímos AB(l) por Aj na base para formar Bbarra
  bind(l)=j;
  # encontramos Binv_barra a partir de Binv e u
  Binv_barra = atualiza_Binv(Binv, u, l);
  Binv = Binv_barra;
  ind = 1;
  return;
endfunction
