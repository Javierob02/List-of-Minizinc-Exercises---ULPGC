int: n;
n = 5;
array[1..n] of var 0..9: x;
constraint sum(x) == product(x);
constraint forall([x[i] <= x[j] | i,j in 1..n-1 where i < j]);
solve maximize sum(x);