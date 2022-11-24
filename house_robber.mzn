int: n;

array[1..n] of int: value;
array[1..n] of var 0..1: taken;

constraint forall(i in 1..n-1)(taken[i] + taken[i+1] <= 1);
var int: total_value = sum(i in 1..n)(taken[i] * value[i]);

solve maximize total_value;

output["taken = ", show(taken), "\n", "total_value = ", show(total_value)]