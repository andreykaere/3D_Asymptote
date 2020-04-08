settings.outformat = "pdf";
settings.prc = false;
size(200); 
settings.render=0;
import graph3; 
import geometry;
currentprojection=obliqueX; 
limits(O,1.2*(X+Y+Z));
xaxis3(Arrow3);
yaxis3(Arrow3);
zaxis3(Arrow3);
label("$x$",X,NW);
label("$y$",Y,N);
label("$z$",Z,NW);
label("$\rm O$", (0,0,0), W);
real r=1, th=pi/4, phi = pi/3;
triple O = (0,0,0);
triple P = (r*sin(th)*cos(phi), r*sin(th)*sin(phi) ,r*cos(th));
triple M =(0,0,P.z),L=(P.x,P.y,0);
dot(O); dot(P);
label("$P(\rho,\phi,z)$",P,NE); label("$M$",M,W);
draw("$z$", (P.x,P.y,0)--P,dashed);
draw("$\rho$",M--P,dashed);
draw(O--L,dashed);
draw("$\phi$", arc(O,.25*(1,0,0),.25*L), .6*N, Arrow3(HookHead2)); 

dot("$M'$", project(M));
dot("$P'$", project(P));
distance("$y$",project(O),project(P),rotated=false,0mm,joinpen=nullpen);
distance("$x$",project(M),project(P),rotated=false,-10mm,joinpen=dashed);