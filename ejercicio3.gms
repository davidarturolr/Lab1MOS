*************************************************************************
******************        Ejericio 3      *******************************
************     Camilo Mercado & David Leon       **********************
*************************************************************************

Sets
  i      procesador de origen   /o1, o2, o3/
  j      procesador de destino  /d1, d2, d3, d4/;

Table c(i,j) employee work

    d1  d2  d3  d4
o1  8   6   10  9
o2  9   12  13  7
o3  14  9   16  5;

Parameter

po(i)   proceso de origen   / o1 300, o2 500, o3 200/
pd(j)   proceso de destino  / d1 200, d2 300, d3 100, d4 400/;

Variables
x(i,j)                          Determina la cantidad de procesos enviados entre i y j
z                               Funcion Objetivo -> costo de envío final;

Positive Variable x;

Equations
funcObjetivo                       Funcion Objetivo

res1(i)                            Restriccion 1 -> para cada proceso de origen
res2(j)                            Restriccion 2 -> para cada proceso de destino
;

funcObjetivo                   ..      z =e= sum((i,j), c(i,j)*x(i,j));

res1(i)                        ..      sum((j), x(i,j)) =e= po(i);
res2(j)                        ..      sum((i), x(i,j)) =e= pd(j);

Model model1 /all/ ;

option lp=CPLEX;
Solve model1 using mip minimizing z;

Display z.l;