settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;

import three;
import graph3;

import graph;

//settings.antialias=1;
//import geometry3d;
//import plain_picture;

//projection P = orthographic(-5,5,5);
projection P = orthographic((2,5,7));
currentprojection = P;

size3(8cm);
//size(10cm);

limits(10*(-10,-10,-10),10*(10,10,10));
xaxis3("$x$",Arrow3);
yaxis3("$y$",Arrow3);
zaxis3("$z$",Arrow3);

/*
//xaxis("$x'$",xmin=-10,xmax=10,Arrow);
//yaxis("$y'$",ymin=-10,ymax=10,Arrow);
*/
xaxis("$x'$",Arrow);
yaxis("$y'$",Arrow);

triple A = (-9,-5,7);
triple B = 4*(-2,1,0);
triple C = 4*(2,1,1);


real length(triple A=O, triple B) {
    return sqrt((A.x - B.x)^2 + (A.y - B.y)^2 + (A.z - B.z)^2);
}

/*
dot("$A$", A);
dot("$B$", B);
dot("$C$", C);
*/
/*
triple P=B;
triple Q=C;

real d = abs(cross(unit(P-Q), unit(A-P))*length(A, P));
triple H = intersectionpoint(P--Q, circle(A, d, normal(A--P--Q))); 
*/
//dot("$A$", 4*(-1,-1,1));
//dot(4*(-1,-1,0));
//dot("$A$", A);

//dot((0,10*length(cross(Z, P.camera))/length(P.camera)));
//dot((0,0,10));


//write("x", cross((0,0,1), (2,5,7)));
//dot("$X$", cross((0,0,1), (2,5,7)));

triple X = cross((0,0,1), (2,5,7));
triple Ap = (A.x, A.y, 0);
real d = length(cross(Ap, X))/length(X);
/*
dot(Ap, brown);
//draw(circle(Ap, d));
write("d", d);

real s = (-2*9-25+49)/length(P.camera);

dot((1,sqrt(d^2+(A.z)^2-s^2)));

write("c", cross((0,0,1), (2,5,7)));
//dot(P.camera);
write("z", (cross(cross((2,5,7), (0,0,1)), (0,0,1))));
dot(cross( (-5,-7,0), (0,0,1)));

//dot((-9,-5,0), blue);
real angle(triple v1, triple v2) {
    return 180 * acos(dot(v1,v2)/(length(v1)*length(v2)))/pi;
}

write(length((-5,-7,0)));
write(length((1,0,0)));
write(dot((-5,-7,0), (1,0,0)));
write(angle((-5,-7,0), (1,0,0)));
transform3 r = rotate(-angle((-5,2,0), (1,0,0)), (0,0,1));
transform3 rp = rotate(angle((-5,2,0), (1,0,0)), (0,0,1));

triple e = invert((0,1), Y,O);

real k = 1/e.z;

real y0 = 70/29;
triple h = ((-5/2)*y0,y0,(y0+5)*7/5 + 7);
triple i = ((2/5)*(y0+5)-9,y0,(y0+5)*7/5 + 7);

dot((sqrt((h.x)^2+(h.y)^2),5), purple);
dot((0,0,h.z));
dot((0,h.y,0));
dot((h.x,0,0));
draw((h.x,0,0)--(h.x,10,0));
//dot((0,17/e.z));
dot(circle((0,0),length((h.x,h.y,0))));
dot(unit(X));
//dot((-2,-5,0));
write("h", h);
write("i", i);
write("h'", r*h);
triple g = r*h;

draw(A--(-9,-5,-15), blue);

write(g);
dot(P.up);
draw(circle((0,0),1));
dot((g.x,k*g.z));

dot(r*h, purple);
triple Ap = r*A;
dot("$A'$", Ap);
dot("$A''$", rp*Ap, yellow);
dot((Ap.x, Ap.z), green);
dot(r*(-5,2,0));
dot(rp*(r*(-5,2,0)), red);
write(r*A);
triple B = r*A;
//dot((B.x, B.z), red);
//dot(r*(1,0,1),blue);
//dot((1,0,1),blue);
//write(r*(0,1,1));
//currentprojection = orthographic(normal(A--B--C));

//draw(C--B);
//draw(A--H);

//markrightangle3(A,B,C);

//draw(A--B--C, dashed);

//draw(circle(B, 0.5, normal(A--B--C)));

//dot(midpoint3(B,C));
//dot(midpoint3(B,A));
real y0 = 70/29;


dot(((-5/2)*y0,y0,(y0+5)*7/5 + 7),orange);
write(((-5/2)*y0,y0,(y0+5)*7/5 + 7));


//triple e = (0,0,1)+unit(P.camera);
//dot((0, length(e)*sin(pi/180*angle(P.up, P.camera))), purple);

*/
triple A = (-50,-55,70);
//triple A = (0,0,10);
//triple A = invert((5,5), Z, O);

triple Op = invert((0,0));
write(A);
write(2*A.x+5*A.y+7*A.z);



pair project3(triple A, projection P = currentprojection) {
triple X = cross(Z, P.camera);

triple Ap = planeproject(P.camera)*A;
real d = length(cross(Ap, X))/length(X);


triple V = (A.x, A.y, 0);
real p = length(cross(V, X))/length(X);


return (sqrt((length(V))^2 - p^2),d);

} 


triple Ap = planeproject(P.camera)*A;

dot(A, opacity(.5));
//dot("$A$", (5,5), red);
//dot(project(Ap, P.t), linewidth(3));
//real d = length(cross((A.x,A.y,0), X))/length(X);

//real s = (2*A)/length(P.camera);

//dot((6,sqrt(d^2+(A.z)^2-s^2)), green+yellow+linewidth(3.5));

real d = length(cross(Ap, X))/length(X);

write("test", project3(invert((50.436436,70.4364), Z,O)));
triple V = (A.x, A.y, 0);
real p = length(cross(V, X))/length(X);


dot((sqrt((length(V))^2 - p^2),d), red+opacity(0.4));
//dot(10*Z, red);
//write(d);

//draw(circle(Ap, d, P.camera));
//dot((6,d), brown);
//dot("$A'$", Ap, brown);
//dot((5,10), red);

write(Ap);
write(A);

write("end");
//draw(O--Ap, red);

//dot(project((A.x,A.y,0)), green);

//dot((A.x, A.y, 0), red);

//dot(, brown+linewidth(3));

//dot((0,length(e)), purple);

//dot((1,20,42),brown);

//dot((-4,-5,4));

write(currentpicture.userMin());
//dot((triple) currentpicture.userMin());
//dot((-10,0,0));


//dot(A);





