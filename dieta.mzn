include "table.mzn";
int: min_energy = 3300;
int: min_protein = 500;
int: max_salt = 180;
int: max_fat = 320;

set of FOOD: desserts = {icecream, banana, chocolatecake, cheesecake, strawberry, brownie, chocolatemousse, apple, tiramisu};
set of FOOD: mains = {lasagna, steak, rice, tacos, spaghetti, croquette, sanjacobo, meatloaf, soup};
set of FOOD: sides = {chips, brocolli, beans, potatoes, salad, mashedpotato, carrot, puree, gazpacho};
enum FEATURE = {name, energy, protein, salt, fat, cost};
enum FOOD;
array[FOOD, FEATURE] of int: dd;

dd = [|icecream, 1200, 50, 10, 120, 400 % icecream
| banana, 800, 120, 5, 20, 120 % banana
| chocolatecake, 2500, 400, 20, 100, 600 % chocolate cake
| steak, 1800, 800, 50, 100, 1200 % steak
| rice, 1200, 50, 5, 20, 100 % rice
| chips, 2000, 50, 200, 200, 250 % chips
| brocolli, 700, 100, 10, 10, 125 % brocolli
| beans, 1900, 250, 60, 90, 150 % beans
| cheesecake, 2200, 550, 30, 225, 800 % cheesecake
| strawberry, 896, 122, 10, 12, 200 % strawberry
| brownie, 3937, 574, 20, 264, 500 % brownie
| tacos,  2430, 160, 108, 250, 450 % tacos
| spaghetti, 1570, 150, 40, 50, 450 % spaghetti
| croquette, 1300, 125, 45, 70, 300 % croquette
| potatoes, 800, 50, 10, 23, 500 % potatoes
| salad, 1000, 100, 15, 10, 125 % salad 
| mashedpotatoes, 950, 220, 60, 60, 270 % mashedpotatoes
| chocolatemousse, 1300, 60, 0, 160, 300 % chocolatemousse
| apple, 500, 50, 12, 36, 100 % apple
| tiramisu, 1200, 200, 20, 300, 500 % tiramisu
| sanjacobo, 3000, 300, 150, 100, 1000 % sanjacobo
| meatloaf, 2000, 500, 70, 200, 1200 % meatloaf
| soup, 1100, 50, 20, 50, 400 % soup
| carrot, 500, 50, 50, 100, 150 % carrot
| puree, 700, 300, 50, 100, 125 % puree
| gazpacho, 600, 250, 40, 80, 250 |]; % gazpacho

set of FOOD: limitation = {icecream, chocolatecake, spaghetti, mashedpotato, banana};
int: max_in_limitation = 2;
    
array[FEATURE] of var int: main;
array[FEATURE] of var int: side;
array[FEATURE] of var int: dessert;
var int: budget;

constraint (card(dessert intersect limitation) + card(main intersect limitation) + card(side intersect limitation)) <= max_in_limitation;

constraint main[name] in mains;
constraint side[name] in sides;
constraint dessert[name] in desserts;

constraint table(main, dd);
constraint table(side, dd);
constraint table(dessert, dd);

constraint main[energy] + side[energy] + dessert[energy] >= min_energy;
constraint main[protein] + side[protein] + dessert[protein] >= min_protein;
constraint main[salt] + side[salt] + dessert[salt] >= max_salt;
constraint main[fat] + side[fat] + dessert[fat] >= max_fat;
constraint budget = main[cost] + side[cost] + dessert[cost];

solve minimize budget;

output["main = ", show(main), ", side = ", show(side), ", dessert = ", show(dessert), ", cost = ", show(budget)]







