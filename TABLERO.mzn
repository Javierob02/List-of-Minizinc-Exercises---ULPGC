%Tablero
include "globals.mzn";
set of int : DIGIT = 0..1;    %Can ignore
int : n;
array[1..2*n, 1..2*n] of int : data;

array[1..2*n, 1..2*n] of var DIGIT : x;    %DIGIT = 0..1
var 1..n: suma_0;
var 1..n: suma_1;
var 1..n: suma_0_c;
var 1..n: suma_1_c;

%restricciones
%copiar los valores de data
%Restricción de 'data'
constraint forall(i,j in 1..2*n)(data[i,j] in DIGIT -> x[i,j] = data[i,j]);
%formula...

%debe haber tantos ceros como unos en filas y columnas
%Filas
constraint forall(i in 1..2*n)(sum(j in 1..2*n)(x[i,j] == 0) = suma_0);
constraint forall(i in 1..2*n)(sum(j in 1..2*n)(x[i,j] == 1) = suma_1);
constraint suma_0 = suma_1;
%Columnas
constraint forall(i in 1..2*n)(sum(j in 1..2*n)(x[j,i] == 0) = suma_0_c);
constraint forall(i in 1..2*n)(sum(j in 1..2*n)(x[j,i] == 1) = suma_1_c);
constraint suma_0_c = suma_1_c;

%No se pueden colocar mas de dos ceros o unos en una misma fila o columna
constraint forall(i in 1..(2*n), j in 1..(2*n-2))(x[i,j] = x[i+1,j] -> x[i,j]!=x[i+2,j]);    %En fila
constraint forall(i in 1..(2*n), j in 1..(2*n-2))(x[i,j] = x[i,j+1] -> x[i,j]!=x[i,j+2]);    %En columna