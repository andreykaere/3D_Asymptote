settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;

import three;
import graph3;
import geometry3d;

import graph;
import patterns;
real H=1.5mm;


projection P = orthographic(2,-7,2);
pair dir=N+E*3;
//projection P = orthographic((-2,-5,7));
add("hatch", hatch(H, dir, linewidth(0.2)));
add("hatchback",shift(5)*rotate(90)*hatch(H, dir, linewidth(0.1)));
//add("hatchback",hatch(NW));

//currentlight=nolight;

currentprojection = P;

size3(7cm);


revolution s = sphere(O, 1);

real xa = .6;
real ya = -.7;
real xb = .8;
real yb = -.5;
real xc = 0;
real yc = -.9;



triple A = (xa,ya,sqrt(1-xa^2-ya^2));
triple B = (xb,yb,-sqrt(1-xb^2-yb^2));
triple C = (xc,yc,-sqrt(1-xc^2-yc^2));


path3 arcAB = Arc(O,A,B);
path3 arcCA = Arc(O,C,A);
path3 arcBC = Arc(O,B,C);

triple Ap = -A;

path3 arcApC = Arc(O,Ap,C);
path3 arcBAp = Arc(O,B,Ap);

path3 sphr_trin = arcAB .. arcBC .. arcCA .. cycle;
path3 sphr_trin1 = arcAB .. arcBAp .. arcApC .. arcCA .. cycle;

//path tri = project3(sphr_trin);
path tri1 = project3(sphr_trin1);

triple tri(pair p){
    path3 cr=Arc(O,relpoint(arcApC..arcCA,p.x),relpoint(reverse(arcAB..arcBAp),p.x));
    //draw(cr,red);
    //dot(relpoint(arcApC..arcCA,p.x), green);
    return relpoint(cr,p.y);
};


{
triple Q = intersectionpoint(Arc(O,Ap,C), Circle(O,1,P.normal));
triple T = intersectionpoint(Arc(O,B,Ap), Circle(O,1,P.normal));
triple Qp = intersectionpoint(Arc(O,Ap,C,CW), Circle(O,1,P.normal));
triple Tp = intersectionpoint(Arc(O,B,Ap,CW), Circle(O,1,P.normal));
//point Q = intersectionpoint(project3(Arc(O,Ap,C)), project3(s.silhouette()[0]));
draw(Circle((0,0),1), linewidth(1.1));
//draw(project3(arcApC..arcCA), blue);
//draw(project3(Arc(O,Ap,C)), green);
//path3 w = Circle(O,B,cross(O-C,O-B));

//dot("$Q$", Q, SW);
//dot("$T$",T,SE);

path3 arcQT = Arc(O,Q,T);
path3 arcAQ = reverse(Arc(O,Q,A));
path3 arcTA = Arc(O,T,A);

//draw(arcQT,red);
//draw(arcAQ,red);
//draw(arcTA,red);

path t = project3(arcAQ..arcQT..arcTA..cycle);
//draw(t,green);

fill(t, pattern("hatch"));


path3 arcApQ = Arc(O,Ap,Q);
path3 arcTAp = Arc(O,T,Ap);

//draw(arcQT,red);
//draw(arcAQ,red);
//draw(arcTA,red);

path t1 = project3(arcApQ..arcQT..arcTAp..cycle);
//draw(t1,green);
fill(t1, pattern("hatchback"));


draw(arcAQ^^arcTA,linewidth(1.1));
draw(arcApQ^^arcTAp, linetype(new real[] {8,4}) +linewidth(1.1));
draw(A--Ap,linetype(new real[] {13,6})+linewidth(.4));
//path3 sphr_trin1 = arcAQ ..  .. arcApC .. arcCA .. cycle;

//path tri = project3(sphr_trin);
//path tri1 = project3(sphr_trin1);

//draw(sphr_trin1,linewidth(.8));

draw(Arc(O,Qp,A)^^Arc(O,Tp,A));
draw(Arc(O,Qp,Ap)^^Arc(O,Tp,Ap), linetype(new real[] {13,6}));

}
//draw(w^^e(1,X)*w);
//draw(w);
//draw(shift(0.1*cross(O-C,O-B))*w);
//draw(shift(0.2*cross(O-C,O-B))*w);
//draw(shift(0.3*cross(O-C,O-B))*w);
//draw(shift(-0.1*cross(O-C,O-B))*w);
//draw(shift(-0.2*cross(O-C,O-B))*w);
//draw(shift(-0.3*cross(O-C,O-B))*w);

//real x = 0.9;
//triple V1 = relpoint(arcApC..arcCA,x);
//triple V2 = relpoint(reverse(arcAB..arcBAp),x);
//write(tri((.1,.1)))
//dot(tri((x,x)));
//dot(V1, green);
//dot(V2, green);
//dot(relpoint(arcApC..arcCA,0.01),red);


//draw(surface(tri,(0.0000001,0.0000001),(1-.0000001,1-0.000001), Spline), white + opacity(0.01),meshpen=gray);


//write(arclength(arcApC..arcCA));

//write(sqrtEpsilon*max(abs(V1),abs(V2)));

//draw
//draw(s.silhouette(), linewidth(1.1));

dot("$A$", A, N+E);
dot("$A'$", Ap, S+W*1.9);
//dot("$B$", B, SW);
//dot("$C$", C, SE);
dot("$O$", O, NW);



//draw(arcAB);
//draw(arcCA);
//draw(arcBC);

//draw(arcApC);
//draw(arcBAp);
//draw(sphr_trin1,linewidth(.8));
//draw(surface(tri), red+opacity(.7));
//fill(tri1, pattern("hatch"));
