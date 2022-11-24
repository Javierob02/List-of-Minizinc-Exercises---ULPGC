array[1..5] of var string: x = ["a", "n", "o", "r", "s"];
array[1..5] of var 0..1: taken;

constraint forall(i in 1..5)((x[i] * taken[i]) <= 1);
output[show(x)]