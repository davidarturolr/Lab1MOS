*************************************************************************
******************        Ejericio 2      *******************************
************     Camilo Mercado & David Leon       **********************
*************************************************************************


Sets
  j      trabajo   /t1, t2, t3, t4/
  i      empleados /e1, e2, e3, e4/;

Table c(i,j) employee work

     t1  t2  t3 t4
e1   14  5   8  7
e2   2   12  6  5
e3   7   8   3  9
e4   2   4   6  10;

Variables
x(i,j)                          Determina si se escoge o no el trabajo j del empleado i
z                               Funcion Objetivo;

Binary Variable x;

Equations
funcObjetivo                       Funcion Objetivo

res1(i)                            Restriccion 1 -> para todo empleado
res2(j)                            Restriccion 2 -> para todo trabajo
;

funcObjetivo                   ..      z =e= sum((i,j), c(i,j)*x(i,j));

res1(i)                        ..      sum((j), x(i,j)) =e= 1;
res2(j)                        ..      sum((i), x(i,j)) =e= 1;

Model model1 /all/ ;

option mip=CPLEX;
Solve model1 using mip minimizing z;

Display x.l;
Display z.l;