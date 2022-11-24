int: n = 5;
array[1..n] of var 0..3: x;
constraint forall(i in 1..n-1 where i = 1)(x[i] == 0);
constraint forall(i in 1..n-1 where i = n-1)(x[i+1] == 3);
constraint forall(i in 1..n-1)((x[i] + x[i+1]) <= 3);
constraint forall(i in 1..n-1 where i mod 3 = 0)(x[i] >= 2);
solve maximize sum(x);