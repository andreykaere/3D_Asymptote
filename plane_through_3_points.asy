import three;
import solids;
import graph3;
import geometry;
settings.prc = false;
//settings.outformat = "png";
//settings.render = 16;
size(8cm);
//draw(circle(O, 3));
/*
void drawrightangle(picture pic=currentpicture,
                    triple M, triple A, triple B,
                    real radius=0,
                    pen p=currentpen,
                    pen fillpen=nullpen,
                    projection P=currentprojection)
{
  p=linejoin(0)+linecap(0)+p;
  if (radius==0) radius=arrowfactor*sqrt(2);
  transform3 T=shift(-M);
  triple OA=radius/sqrt(2)*unit(T*A),
    OB=radius/sqrt(2)*unit(T*B),
    OC=OA+OB;
  path3 _p=OA--OC--OB;
  picture pic_;
    draw(pic_, _p, p=p);
    if (fillpen!=nullpen) draw(pic_, surface(O--_p--cycle), fillpen);
  add(pic,pic_,M);
}

triple A = (1, 1, 1);
triple B = (0, -2, 3);
triple C = (2, 5, 2);

path3 planeabc(triple A, triple B, triple C) 
{
	var x_a = B.x - A.x;
	var y_a = B.y - A.y;
	var z_a = B.z - A.z;

	real x_b = C.x - A.x;
	real y_b = C.y - A.y;
	real z_b = C.z - A.z;

	real x_n = 0;
    real y_n = -1;
    real z_n = -1;

	if (z_b*y_a == z_a*y_b) {
        z_n = 1;
    } else {
        z_n = 0;
    }

    if (y_a == 0) {
        y_n = -z_n*z_a/y_a;
    } else {
        y_n = 0;
    }

    return plane(A, (A.x+x_n, A.y+y_n, A.z+z_n), A);
}


pair P(triple a) {return (a.y, a.x);}
currentprojection=orthographic((5,4,3));

path3 pl =plane((0,-2,0),(-2,0,0),(0,1,0));
//draw(pl, red+opacity(.5));
//draw(path(pl, P), blue+opacity(1));

guide3 s1 = A--B;
guide3 s2 = A--C;
/*
markrightangle(point(s1, 1), 
               point(s1, 0), 
               point(s2, 1));
*/

/*
markrightangle(project(B), project(A), project(C));
drawrightangle(A, B, C);
markangle(project(C), project(A), project(B));
//draw(planeabc(A, B, C));
//currentprojection = perspective(1,1,1); 

//draw(plane(A, B));
//draw(plane(C, B, A));
//draw(plane(A, C));

draw(A--C);
draw(A--B);
draw(B--C);

pair D = (0,0);
draw(line(project(A), D));
//drawrightangle(A, invert(D), C);
drawrightangle(invert(D), A,  C);
drawrightangle(A, C, invert(D), 10mm);
markrightangle(D, project(A), project(C));
dot("$D$", invert(D));
dot("$A'$", project(A));
dot("$B'$", project(B));
dot("$C'$", project(C));

dot("$A$", A);
dot("$B$", B);
dot("$C$", C);

xaxis("$x$",Arrow);
yaxis("$y$",Arrow);



draw(C..A..invert(D)..cycle);
limits((-2,-2,-2),(2,2,2));
xaxis3("$x$",Arrow3);
yaxis3("$y$",Arrow3);
zaxis3("$z$",Arrow3);
*/
//triple P = normal(A--B--C);
//currentprojection=perspective(P.x, P.y, P.z, center=true);
//currentprojection=perspective(70,-30,3);
currentprojection=obliqueX;
//projection R = perspective(0,0,3);

triple A = (-7,0,5);
triple B = (10,7,0);
triple C = (0,15,0);

triple T = normal(B--C--O);
projection R = perspective(T);
//projection R = orthographic(normal(B--C--O));
limits((-20,-20,-20),(20,20,20));
xaxis3("$x$",Arrow3);
yaxis3("$y$",Arrow3);
zaxis3("$z$",Arrow3);

//dot("$N$", (70, -30,2));

//xaxis("$x$",Arrow);
//yaxis("$y$",Arrow);




dot("$A$", A);
dot("$B$", B);
dot("$C$", C);
dot("$O$", O);
//dot((string) T.x, A);
//dot((string) T.y, B);
//dot((string) T.z, C);


//currentprojection=R;
pair Op = project(O, R);
pair Bp = project(B, R);
pair Cp = project(C, R);

path g = incircle(Op, Bp, Cp);


dot("A", invert(project(A)));
write(project(A));
write(invert(project(A)));
write(A);
draw(path3(path(A--B--C), plane=XYplane), blue);
currentprojection=perspective(normal(A--B--C));
/*
//triple P = normal(A--B--C);
//currentprojection=perspective(P);
draw(invert(g, R));
draw(B--C);
draw(B--O);
//dot(T);
dot(normal(B--C--O));


triple T = normal(A--B--C);
projection Q = perspective(T);
projection Q = perspective(5,4,2);
//projection Q = orthographic(T);
currentprojection=Q;
pair Aq = project(A,Q);
pair Bq = project(B,Q);
pair Cq = project(C,Q);

write(project(A,currentprojection));
write(project(A));
write(Aq);
write(A);
dot("red",project(A), red*5pt);

path i = incircle(Aq, Bq, Cq);

dot("A", Aq);
dot("B", Bq);
dot("C", Cq);

//dot((string) T.x, A);
//dot((string) T.y, B);
//dot((string) T.z, C);
//real e = T.x;
//real w = T.y;
//real f = T.z;
//real U = sqrt(e^2+f^2+w^2);

//dot((string) U, O);
draw(A--B);
draw(A--C);
draw(invert(i,Q));
//draw(path3(i,Q), red+2pt);

dot(project(B), blue);
//currentprojection=perspective(5,4,2);
//currentprojection=perspective(normal(A--B--C));

//currentprojection=orthographic(30, 20, 10);
//currentprojection=perspective(normal(A--B--C));

//dot(normal(A--B--C));


draw(B..A..C..cycle);

*/
