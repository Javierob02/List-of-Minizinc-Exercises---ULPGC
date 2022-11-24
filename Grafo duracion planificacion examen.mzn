int : num_tasks = 8;
array[1..num_tasks] of int : duration;
int : available_time;

array[1..num_tasks] of var 0..available_time : start;
var 0..available_time: end;

output[show(end)];

constraint start[num_tasks] + duration[num_tasks] <= available_time;
constraint start[1] = 1;
constraint forall(i in 2..4) (start[i] = duration[1]+start[1]);
constraint forall(i in 2..3) (start[5] >= duration[i] + start[i]);
constraint forall(i in 6..7) (start[i] = duration[4] + start[4]);
constraint forall(i in 5..7) (start[8] >= duration[i] + start[i]);
constraint end = start[num_tasks] + duration[num_tasks];

%solve minimize end;