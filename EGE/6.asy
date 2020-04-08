settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;

import three;
import graph3;
import geometry3d;

import graph;

//settings.antialias=1;
//import plain_picture;

projection P = orthographic(5,-7,4);
//projection P = orthographic((-2,-5,7));
currentprojection = P;

size3(6cm);
//size(10cm);

//limits(.55*(-10,-10,0),.55*(10,10,10));
//xaxis3("$x$",Arrow3);
//yaxis3("$y$",Arrow3);
//zaxis3("$z$",Arrow3);

/*
//xaxis("$x'$",xmin=-10,xmax=10,Arrow);
//yaxis("$y'$",ymin=-10,ymax=10,Arrow);
*/
/*
xaxis("$x'$",Arrow);
yaxis("$y'$",Arrow);
*/

real side = 4;
real height = 2;

triple A = (0,0,0);
triple B = (-side*sqrt(3)/2,side/2,0);
triple C = (0,side,0);

transform3 s = shift(Z*height);

triple A1 = s*A;
triple B1 = s*B;
triple C1 = s*C;


triple M  = midpoint3(A1,C1);
triple N_ = midpoint3(B1,C1);

triple O_ = intersectionpoint(B1--A,A1--B);

path3 section = A--M--N_--B--cycle; 

triple P = midpoint3(B1, A1);
triple Q = midpoint3(B, A);

triple K = midpoint3(C1, P);

triple L = intersectionpoint(K--Q, C1--O_);

//path3 main_section = C1--C--Q--P--cycle;

//draw



//markrightangle3(A,B,C,10);

draw(B--C, dashed);
draw(C--Q, dashed);
draw(C1--O_, dashed);

draw(B--M, dashed);
draw(A--N_, dashed);
dot(L);
//draw(C--Q, dashed);
draw(K--Q, dashed);



label(Label("$A$", UnFill), A1, S*0.35+E*0.7);
dot(Label("$O$", UnFill), O_, N*.5+W);
draw(surface(section), grey+opacity(.5));
//fill(project3(section), red+opacity(.7));

dot("$A$", A1, S*0.35+E*0.7);
dot("$O$", O_, N*.5+W);

draw(A--B1^^B--A1);
draw(Q--P--C1);
draw(C--A--B^^B1--C1--A1--B1^^B1--B^^C1--C^^A1--A);
//draw(A--M--N_--B--cycle);
draw(section);



dot("$A$", A, S*0.3+E*0.7);
dot("$B$", B, SW);
dot("$C$", C, SE);


//dot(Label("$A_1$", S*0.3+E*0.7, UnFill), A1);

dot("$B_1$", B1, NW);
dot("$C_1$", C1, NE);

dot("$M$", M, S*0.2+E);
dot("$N$", N_, N+E*0.7);
dot(Label("$K$", UnFill), K, N*0.2+E*1.2);

dot("$P$", P, S*0.2+W*0.7);
dot("$Q$", Q, SW);


markrightangle3(C1,P,Q,1.4);
markrightangle3(C1,C,A,1.4);
markrightangle3(C1,C,B,1.6);

/*
void fill_sphere (revolution sphere, pen p) {
    path3[] skeleton_parts = sphere.silhouette();
    path3 skeleton = skeleton_parts[0]..skeleton_parts[1]..cycle;
    draw(skeleton, linewidth(1));
    draw(surface(skeleton), p);
    //path skeleton_circ = project3(skeleton);
    
}

//currentlight = nolight;
currentlight = Viewport;

revolution b = sphere((0,0,0), 5, 10^4);
surface s = scale3(5)*unitsphere;

path3 myarc = Arc(c=O,
            normal=X, v1=-Z, v2=Z, n=10);

//draw(myarc, green);

//surface sphere = surface(myarc, angle1=0,
//   angle2=360, c=O, axis=Z, n=10);
//draw(unitsphere,
//    surfacepen=material(diffusepen=gray,
//    emissivepen=black, specularpen=black));

surface t = surface(sphere(O, 1));

triple U = (B+C)/3;
dot(U);
triple D = (U.x, U.y, side*sqrt(6)/3);
dot(D);
*/

//draw(surface(sphere(O, 1)), surfacepen=lightgrey+opacity(.5));
//draw(surface(revolution(O, myarc,Z,0,360)), red+opacity(.5));

//draw(sphere, green+opacity(.4));

//draw(b.silhouette());

//draw(s, blue+opacity(0.5));
//draw(circle((0,0), 5), red);
//fill_sphere(b, red+opacity(.5));
//draw(unitsphere, orange);
//draw(b.shi

