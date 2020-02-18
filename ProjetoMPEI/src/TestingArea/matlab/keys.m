function array = keys(array,phrase)
  length = size(array);
  length = sum(length)-1;
  pos = rem(string2hash(phrase),length);
  array(1,pos)=1;
endfunction