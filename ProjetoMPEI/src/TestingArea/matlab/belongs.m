function belongs = belongs(phrase,array)
  length = size(array);
  length = sum(length)-1;
  pos = rem(string2hash(phrase),length);
  if(array(1,pos)>0)
    belongs = "Maybe belongs";
  else 
    belongs = "Doesn't belongs";
  endif
endfunction;