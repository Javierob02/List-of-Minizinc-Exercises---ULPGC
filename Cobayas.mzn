include "globals.mzn";

int: N= 9;
int: M = 100;
set of int: Suplement = 1..20;

array[1..N] of var Suplement: Diet;

output[show(Diet)];

% Escribe aquí tu código

constraint forall(i, j, k in 1..9 where i != j /\ j != k /\ i != k)(Diet[i] - Diet[j] != Diet[j] - Diet[k]);
constraint alldifferent(Diet);
constraint forall(i in 2..9)(Diet[i-1] <= Diet[i]);