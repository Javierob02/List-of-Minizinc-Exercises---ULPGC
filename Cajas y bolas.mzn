int : n;    %Bolas
int : c;    %Cajas

array[1..n] of var 1..c : box;

output[show(box)];

constraint forall (i in 1..n-1) (box[i] <= box[i+1]);    %Más o igual en siguientes cajas que primera
constraint forall (i in 1..c) (sum(j in 1..n)(box[j] == i) <= 3);    %No más de 3 bolas por caja
constraint forall (i in 1..c) (sum(j in 1..n)(box[j] == i) > 0);    %Caja no puede estar vacía
constraint forall (i, j, k in 1..n where i != j /\ i != k /\ j != k)(box[i] == box[j] /\ box[j] == box[k] -> i + j != k);

solve maximize max(box);