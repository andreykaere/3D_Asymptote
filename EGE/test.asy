settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;

import three;
import graph3;
import geometry3d;

import graph;

//settings.antialias=1;
//import plain_picture;

projection P = orthographic(5,5,5);
//projection P = orthographic((-2,-5,7));
currentprojection = P;

size3(8cm);
//size(10cm);

limits(2*(-10,-10,-10),2*(10,10,10));
xaxis3("$x$",Arrow3);
yaxis3("$y$",Arrow3);
zaxis3("$z$",Arrow3);

/*
//xaxis("$x'$",xmin=-10,xmax=10,Arrow);
//yaxis("$y'$",ymin=-10,ymax=10,Arrow);
*/
/*
xaxis("$x'$",Arrow);
yaxis("$y'$",Arrow);
*/
triple A = (-15,7,10);
triple B = (-8,10,0);
triple C = (10,5,0);


path3 w = circle(B, 5);

//path c = path(w, project3);
//draw(w);

draw(project3(w), red);

dot("$A$", A);
dot("$B$", B);
dot("$C$", C);



markrightangle3(A,B,C,10);

draw(A--B--C);

