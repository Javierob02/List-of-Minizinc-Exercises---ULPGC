include "globals.mzn";
int: n;
set of int: DIGIT = 0..1;
array[1..2*n, 1..2*n] of int: data;
array[1..2*n, 1..2*n] of var DIGIT: x;

%var int: puntuancion = ...

var 1..n: suma_0s_row;
var 1..n: suma_1s_row;
var 1..n: suma_0s_col;
var 1..n: suma_1s_col;

%FORMULA%

%Restricción de data
constraint forall(i, j in 1..2*n)(data[i, j] in DIGIT -> x[i, j] = data[i, j]);

%Tantos 1s como 0s
%Filas
constraint forall(i in 1..2*n)(sum(j in 1..2*n)(x[i, j] == 0) = suma_0s_row);
constraint forall(i in 1..2*n)(sum(j in 1..2*n)(x[i, j] == 1) = suma_1s_row);
constraint suma_0s_row = suma_1s_row;
%columnas
constraint forall(i in 1..2*n)(sum(j in 1..2*n)(x[j, i] == 0) = suma_0s_col);
constraint forall(i in 1..2*n)(sum(j in 1..2*n)(x[j, i] == 1) = suma_1s_col);
constraint suma_0s_col = suma_1s_col;

%No se pueden colocar mas de dos ceros o unos en una misma fila o columna
constraint forall(i in 1..2*n, j in 1..2*n-2)(x[i, j] == x[i+1, j] -> x[i, j] != x[i+1, j]);  %Fila
constraint forall(i in 1..2*n, j in 1..2*n-2)(x[i, j] == x[i, j+1] -> x[i, j] != x[i, j+1]);  %Columna

%solve maximize puntuacion;


