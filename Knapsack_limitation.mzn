int:n = 3; %numero maximo de items
int: capacity = 10; 
set of int: ITEMS = 1..n; 
array[ITEMS] of int: value = [45,48,35]; 
array[ITEMS] of int: weight = [5,5,3];

int:m = 1; %numero maximo de items a elegir dentro del conjuto limitation
set of ITEMS: limitation = {1,2};
%array[1..n] of var 0..1: taken_a;
var set of ITEMS: taken_s;

constraint sum(i in taken_s)(weight[i]) <= capacity;

%limitation
constraint card(taken_s intersect limitation) <= m;

var int: total_value = sum(i in taken_s)(value[i]);

solve maximize total_value;

output["taken = ", show(taken_s), "\n", "Total Value = ", show(total_value)]