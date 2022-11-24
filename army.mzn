int: coste = 10000;
var 0..1000: f;
var 0..400: l;
var 0..500: z;
var 0..150: j;

constraint ((f*13)+(l*21)+(z*17)+(j*100)) <= 10000;

var int: fuerza_f = 6*f;
var int: fuerza_l = 10*l;
var int: fuerza_z = 8*z;
var int: fuerza_j = 40*j;

var int: fuerza = (fuerza_f + fuerza_l + fuerza_z + fuerza_j);

solve maximize fuerza