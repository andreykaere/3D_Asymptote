import three;
import solids;
import graph3;
//import geometry3d;
settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;
size(8cm);


currentprojection = perspective(10, 10, 5);
//currentprojection = obliqueX;


limits((-20,-20,-20),(20,20,20));
xaxis3("$x$",Arrow3);
yaxis3("$y$",Arrow3);
zaxis3("$z$",Arrow3);



triple A = (-7,0,5);
triple B = (10,7,0);
triple C = (0,15,0);



dot("$A$", A);
dot("$B$", B);
dot("$C$", C);

draw(plane(A-B,B-C,C));

currentprojection = orthographic(cross(A-B, B-C));
//dot("A", invert((1,2)));
//dot("D", (1,2));
//dot("L", project(invert((1,2))));
//dot("A'", project(B));
/*
triple R = invert((1, 2));
triple F = invert((7, 12));
triple G = invert((4, 5));

path y = incircle(project(R), project(G), project(F));

triple U = normal(R--F--G);
currentprojection = perspective(U);

dot("G", G);
dot("F", F);
dot("R", R);
dot("U", U);
//draw(y);
//write(invert(G));
*/
