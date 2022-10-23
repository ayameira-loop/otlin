function [x bind Binv ind v] = simplex_iter2(A,b,c,m,n,x,bind,Binv)
  xB = x(bind);
  nind = [1:n];
  for i = bind
    nind = nind(nind~=i);
  endfor
  v = 2;
  ind = 2;
  # calcula o custo reduzido: cbarra
  cB = c(bind);
  cbarra = c' - cB' * Binv * A;

  # se não houver cbarra_j < 0, estamos em ponto ótimo e paramos
  if (any(cbarra < 0) == 0)
    v = x;
    ind = 0;
    return;
  endif

  print1(c, x, bind, nind, xB, cbarra)

  # se houver, procuramos j, tq cbarra_j seja o mais negativo
  min = cbarra(1);
  cont = 1;
  for i = cbarra
    if (i < min)
      min = i;
      j = cont;
    endif
    cont=cont+1;
  endfor

  # encontramos a direção
  u = Binv * A(:,j);


  # se nenhuma componente de u for positiva, então teta = inf e o custo ótimo é -inf. paramos
  if (any(u > 0) == 0)
    v = u;
    ind = -1;
    return;
  endif

  # calculamos teta: para cada ui > 0, queremos que teta = min{ xB(i)/ui }
  # seja l o índice que satisfaz este teta
  cont = 1;
  l = cont;
  min = xB(cont)/u(cont);
  for i = u
    if (i>0)
      r = xB(cont)/u(cont);
      if (r < min)
        min = r;
        l = cont;
      endif
    endif
    cont = cont+1;
  endfor
  teta=min;

  # atualizamos x
  d = zeros(n, 1);
  d(j) = 1;
  d(bind) = -u;
  x = x + d*teta;


  print2(j, d, teta, l, bind);

  # substituímos AB(l) por Aj na base para formar Bbarra
  bind(l)=j;
  # encontramos Binv_barra a partir de Binv e u
  Binv_barra = atualiza_Binv(Binv, u, l);
  Binv = Binv_barra;

endfunction
