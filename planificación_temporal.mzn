include "cumulative.mzn";

int:n=4; % total programas

int:k=5; % total de programadores

int:max_tiempo = 100; % limite superior de tiempo

array [1..n] of int: tiempo = [2,4,6,3];
array [1..n] of int: prog =   [3,2,4,2];

%%% variables de decisión
array [1..n] of var 0..max_tiempo: comienzo;

var  0..max_tiempo:  total;

% cumulative
constraint cumulative(comienzo, tiempo, prog, k);
constraint forall(i in 1..n)(comienzo[i]+tiempo[i]<=total);
solve minimize total;

output["Total: "++show(total)++"\n"]++[show(comienzo[i])++" " | i in 1..n];