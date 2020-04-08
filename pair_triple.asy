settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;

import three;
import graph3;
//import plain_picture;


limits(2*(-10,-10,-10),2*(10,10,10));
xaxis3("$x$",Arrow3);
yaxis3("$y$",Arrow3);
zaxis3("$z$",Arrow3);



size(8cm);
projection P = orthographic(-2,-4,5);
currentprojection = P;
picture pic = currentpicture;

//var t = scene.t;
//var nodes3 = scene.nodes3;

transform3 t = pic.calculateTransform3();
//write(nodes3);

//triple B = t*A;

triple A = (3,5,8);

transform3 w = planeproject(P.normal);
//write(project(Z, currentprojection));
write(project(A));

dot("$Z$", A);
dot("$Y$", project(t*A, P.t));
