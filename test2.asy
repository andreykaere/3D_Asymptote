import graph;
size(8cm);

xaxis("$x$", xmax=10, xmin=-10, Arrow);
yaxis("$y$", ymax=10, ymin=-10, Arrow);

//xaxis();
//yaxis();

pair A = (5,3);
pair B = (-6,7);

pair C = (11, 11);

path p = (infinity, infinity) --A--B--(-infinity, -infinity);

draw(p);

dot(A);
dot(B);
dot(C);
