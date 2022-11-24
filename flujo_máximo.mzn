%Maximum_flow
% x = flow
% a = capacity
% E = edges
% n = num_nodes
% s = source node
% t = sink node
% flow = max_flow



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
array[1..num_edges] of int: capacity = [14,23,10, 9,12,18,26,11,25, 4, 7, 8,15,20]; % capacidad de cada arista

var int: max_flow; % variable de decision, donde se maxima el flujo maximo
array[1..num_edges] of var int: flow; % variable de decisión donde se indica el flujo final de cada arista

1..num_nodes: s;
1..num_nodes: t;

constraint 
  max_flow >= 0
  /\
  max_flow <= 100
  /\
  forall(i in 1..num_edges) (
    flow[i] >= 0
    /\
    flow[i] <= capacity[i]
  )
  /\
  forall(i in 1..num_nodes) (
      % node[i] is conservation constraint for node i 
      % 
      % summary flow into node i through all ingoing arcs 
      sum(k in 1..num_edges where edges[k,2] = i) (flow[k]) + max_flow * bool2int(i = s)
      = % must equal 
      % summary flow from node i through all outgoing arcs 
      sum(k in 1..num_edges where edges[k,1] = i) (flow[k]) + max_flow * bool2int(i = t)
  )
;

output
[ 
  "max flow =" ++ show(max_flow)
];

%Escribir el código a partir de aquí