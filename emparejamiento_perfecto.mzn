%Perfect Match minimum cost

include "globals.mzn";

int: n = 6;
set of int: VERTEX = 1..n;
array[VERTEX, VERTEX] of int: weights = [|
10000, 5, 3, 10000, 2, 10000|
5, 10000, 10000, 3, 10000, 2|
3, 10000, 10000, 4, 3, 10000|
10000, 3, 4, 10000, 10000, 2|
2, 10000, 3, 10000, 100000, 5|
10000, 2, 10000, 2, 5, 10000|
|];
array[VERTEX] of var VERTEX: edge;
array[1..n] of var 1..n: path; %non existant

var int: coste;

coste = min(i in VERTEX, j in VERTEX where weights[i, j] == weights[j, i]);
constraint forall(i in VERTEX, j in VERTEX where i != j)();
constraint alldifferent(edge); %path

%if emparejamiento perfecto de 1 is 5 de 5 is 1

solve minimize coste;

output[show(coste), " -> ", show(path)]% edge