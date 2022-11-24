int :n = 8;  %8 Reinas
set of int: R = 1..n;  %Set de Reinas 1..8
array[R] of var R: row;  %Lista longitud 8, con valores de 1..8
constraint forall(i in R, j in i+1..n)(row[i] != row[j]);   %Comprueba Filas
constraint forall(i in R, j in i+1..n)(row[i] != row[j] + (j-i));  %Comprueba Diagonal Inferior
constraint forall(i in R, j in i+1..n)(row[i] != row[j] - (j-i));  %Comprueba Diagonal Superior
solve satisfy;