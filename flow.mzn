int: num_nodes = 9; % número de nodos del grafo
int: num_edges = 14; % número de aristas del grafo

1..num_nodes:source = 1; % nodo fuente
1..num_nodes:sink = 9;   % nodo sumidero

array[1..num_edges, 1..2] of int: edges = array2d(1..num_edges, 1..2,
[
       1, 2,
       1, 4,
       2, 3,
       2, 4,
       3, 5,
       3, 8,
       4, 5,
       5, 2,
       5, 6,
       5, 7,
       6, 7,
       6, 8,
       7, 9,
       8, 9]); % aristas del grafo (origen->destino)
array[1..num_edges] of int: capacity = [14, 23, 10, 9, 12, 18, 26, 11, 25, 4, 7, 8, 15, 20]; % capacidad de cada arista

var int: max_flow; % variable de decision, donde se maximiza el flujo maximo
array[1..num_edges] of var int: flow; % variable de decisión donde se indica el flujo final de cada arista

constraint forall(i in 1..num_edges)(flow[i] >= 0 /\ flow[i] <= capacity[i]);      %Cumpla que el flow de cada arista no sea negativo & menor a su capacidad
constraint forall(i in 1..num_nodes where i != source /\ i != sink)(sum(e in 1..num_edges where edges[e, 1] = i)(flow[e]) = sum(e in 1..num_edges where edges[e, 2] = i)(flow[e]));    %No coge flow de nodo de inicio ni final, flow de entrada de un nodo == flow de salida del mismo nodo

max_flow = sum(i in 1..num_edges where edges[i, 2] = sink)(flow[i]);    %Suma de el flow de las aristas de salida para obtener flujo máximo

solve maximize max_flow;      %Maximiza el flow


output
[ 
  "max flow =" ++ show(max_flow)
];
