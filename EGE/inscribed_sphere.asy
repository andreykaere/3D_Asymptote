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

size3(7cm);
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

triple A = (0,0,0);
triple B = (-side*sqrt(3)/2,side/2,0);
triple C = (0,side,0);





triple U = (B+C)/3;
triple S_ = (U.x, U.y, side*sqrt(6)/3);


real r = side*sqrt(6)/12;
real R = 3*r;
triple I_ = (U.x, U.y, r);

revolution s = sphere(I_, r);
revolution w = sphere(I_, R);
surface t = surface(s);

triple K  = foot(I_, S_,B,C);
triple L  = foot(I_, S_,A,C);
triple M  = foot(I_, S_,B,A);
triple N_ = foot(I_, C,B,A);


//draw

dot("$A$", A, S*0.3+E*0.7);
dot("$B$", B, SW);
dot("$C$", C, SE);


dot("$S$", S_, N*.3+E);

draw(s, 1, longitudinalpen=nullpen, linewidth(.3));
//draw(w, 1, longitudinalpen=nullpen, linewidth(.3));

draw(s.silhouette(), linewidth(1.1));
draw(w.silhouette(), linewidth(1.1));

//intersections(t, surface(S_--A--B--cycle));


dot("$K$", K, S*.5+E*1.2);
dot("$L$", L, SE);
dot("$M$", M, W*1.3);
dot("$N$", N_, S*1.3+E);
dot("$I$", I_, S*.7+E);

draw(S_--B--A--S_--C--A, linewidth(.7));
draw(C--B, linetype(new real[] {6,6})+linewidth(.6));

draw(I_--L^^I_--K^^I_--N_^^I_--M);

//draw(circle(K, M, L));

//markrightangle3(I_,L,(2,1,0), 1.1);
markrightangle3(I_,L,A, 1.1);
markrightangle3(I_,K,C, 1.1);
markrightangle3(I_,M,A, 1.1);
markrightangle3(I_,N_,(1,2,0), 1.1);

//draw(t);
