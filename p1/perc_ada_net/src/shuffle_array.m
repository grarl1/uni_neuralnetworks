%Returns an array with elements going from 1 to n shuffled.

function [shuffled] = shuffle_array (n)
  shuffled = 1:n;
  for i = 1:(n-1)
    j=randi([i n]);
    
    t=shuffled(i);
    shuffled(i)=shuffled(j);
    shuffled(j)=t;
  end