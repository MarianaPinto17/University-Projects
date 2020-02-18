function hash = string2hash(str)
  hash=5381;
  i = length(str);
  for c = 1:i
    hash = hash*33 + str(c);
    hash = rem(hash, 2^31-1); % ensures hash value to not rise to much
  endfor
  hash = int64(hash);
endfunction 