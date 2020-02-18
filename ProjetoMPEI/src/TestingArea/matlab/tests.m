%GENERATE X RANDOM STRINGS TO BLOOM FILTER 
%AND SEE EACH ONES BELONGS TO BLOOM FILTER

%symbols to generate random strings
symbols = ['a':'z' 'A':'Z' '0':'9'];

%string to generate hash
str='ola'

%string length to equal to java testbloomfilter
stLength=36;

%random number of strings
c=randi([1 10000]);

%length of bloomfilter
array = bloomfilter(1e4);

for t = i:c
%random numbers to create strings
nums1 = randi(numel(symbols),[1 stLength]);
nums2 = randi(numel(symbols),[1 stLength]);

%create symbols by the generated code from the last line
st1 = symbols(nums1);
st2 = symbols(nums2);

%keys of each str loaded in array
array =(keys(array,st1));

%check if st2 belongs to st1
belongs(st2,array)
end

hash=string2hash(str)