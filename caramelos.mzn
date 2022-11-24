int: n = 3;
array[1..n] of int: notas = [7, 6, 9];
int: max_caramelos = 100000;
array[1..n] of var 1..max_caramelos: x;    %Caramelos a dar por alumno
var int: total_caramelos;
output[show(total_caramelos)];

constraint forall(i in 1..n-1 where notas[i] == notas[i+1])(x[i] == x[i+1]);    %Mismos caramelos si misma nota
constraint forall(i in 1..n-1 where notas[i] > notas[i+1])(x[i] > x[i+1]);  %Diferentes caramelos si distinta nota, NO DOBLE
constraint forall(i in 1..n-1 where notas[i] < notas[i+1])(x[i] < x[i+1]);
constraint forall(i, j in 1..n where i != j) (x[i] < 2*x[j]);
constraint forall(i in 1..n)(x[i] >= 1);  %Cada alumno recibe al menos 1 caramelo
total_caramelos = sum(i in 1..n)(x[i]);  %Suma de caramelos = 'total_caramelos'
constraint total_caramelos <= max_caramelos;  %'total_caramelos' debe ser menor que 'max_caramelos'
solve minimize total_caramelos;