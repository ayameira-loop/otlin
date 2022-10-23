function Binv_barra = atualiza_Binv(Binv, u, l)
  M = [Binv,u];
  m = size(Binv)(1);
  # quero transformar u em el
  M(l,:) = M(l,:)/M(l,:)(end); # transforma a linha l para que u(l) = 1
  q = -M(:,end);
  for i = 1:rows(M) # zera todos os demais u(i), i ~= l
    if (i ~= l)
      M(i,:) = M(i,:) + q(i)*M(l,:);
    endif
  endfor
  Binv_barra = M(1:m,1:m);
endfunction


