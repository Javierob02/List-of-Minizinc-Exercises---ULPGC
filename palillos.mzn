include "alldifferent.mzn";

set of int: DIGIT = 1..9;
array[DIGIT] of int: palillos = [1, 2, 3, 4, 5, 2, 3, 4, 5];
int :suma_palillos = 12;
array[1..5] of var DIGIT: x;
output["Dígitos = ", show(x)];

var int: num1 = 2303 + (x[1]*10);    %23_3
var int: num2 = 980 + (x[2]*1000) + (x[3]);    %_98_
var int: num3 = 301 + (x[4]*1000) + (x[5]*10);    %_3_1

constraint (num1 + num2) == num3;
constraint alldifferent(x);
constraint sum(i in x)(palillos[i]) == suma_palillos;
solve satisfy;