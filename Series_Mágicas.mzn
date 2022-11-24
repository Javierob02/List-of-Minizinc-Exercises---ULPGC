int: n = 5;
set of int: D = 0..n-1;    %D = {0, 1, 2, 3, 4}
array[D] of var D: series;  %Array de longitud 5 y valores D
constraint forall(i in D)(series[i] = (sum(j in D)(series[j] = i)));
solve satisfy