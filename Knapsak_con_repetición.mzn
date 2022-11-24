int:n; 
int: capacity; 
set of int: ITEMS = 1..n; 
array[ITEMS] of int: value; 
array[ITEMS] of int: weight;
array[1..n] of var 0..2: taken;

constraint sum(i in 1..n)(weight[i] * taken[i]) <= capacity;

var int: total_value = sum(i in 1..n)(taken[i] * value[i]);

solve maximize total_value;

output["taken = ", show(taken), "\n", "Total Value = ", show(total_value)]