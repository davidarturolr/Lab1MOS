*************************************************************************
******************        Ejericio 1      *******************************
************     Camilo Mercado & David Leon       **********************
*************************************************************************

Sets
  i      objetos /o1, o2, o3, o4, o5/;

Parameter  v(i)   valor de cada objeto
                     /    o1 12, o2 5, o3 9, o4 6, o5 4/;
Parameter  p(i)   peso de cada objeto
                     /    o1 9, o2 2, o3 2, o4 1, o5 3/;

Variables
x(i)                         Determina si se escoge o no el objeto i
z                            Funcion Objetivo;

Binary Variable x;

Equations
funcObjetivo                 Funcion Objetivo

res1                         Restriccion 1
;

funcObjetivo                ..      z =e= sum((i), v(i) * x(i));

res1                        ..      sum((i), p(i) * x(i)) =l= 10;

Model model1 /all/ ;

option mip=CPLEX;
Solve model1 using mip maximizing z;

Display x.l;
Display z.l;



