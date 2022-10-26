function result = is_basic_viable_solution(A, x, b)
  result = isequal(A * x, b) && all(x >= 0);
endfunction
