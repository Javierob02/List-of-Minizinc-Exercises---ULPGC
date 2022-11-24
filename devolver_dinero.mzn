int: devolver = 21;
array[1..6] of int: x = [5, 2, 1, 10, 10, 2];
array[1..6] of var 0..1: taken;

constraint sum(i in 1..6)(taken[i] * x[i]) = devolver;
solve minimize sum(x)