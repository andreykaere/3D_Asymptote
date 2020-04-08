//import settings;

//gs = "/home/andrey/bin/gs";

settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;
import three;
import bsp;
size(8cm, 0);
currentprojection=orthographic((5,4,3));

path3 pl =plane((0,-2,0),(-2,0,0),(0,1,0));
path3 pl1=rotate(-28,X)*pl;
path3 pl2=rotate(-56,X)*pl;
path3 pl3=shift(-0.3*normal(pl1))*pl1;

triple[] asd=intersectionpoints(pl2,pl3);
triple A=asd[1];
triple B=asd[0];

triple[] asf=intersectionpoints(pl,pl2);
triple C=asf[1];
triple D=asf[0];

triple[] asg=intersectionpoints(pl,pl3);
triple E=asg[1];
triple F=asg[0];

path3 q11=(D -- -Y -- C-Y -- C -- cycle);
surface sq11=surface(q11);
draw(sq11,red+opacity(.6),light=nolight);
draw(D -- -Y -- C-Y -- C--cycle,red);

path3 q21=rotate(-28,X)*q11;
surface sq21=surface(q21);
draw(sq21,blue+opacity(.2),light=nolight);
draw(rotate(-28,X)*(D -- -Y -- C-Y -- C -- cycle),blue);

path3 q31=(D--C--A--B--cycle);
surface sq31=surface(q31);
draw(sq31,green+opacity(.6),light=nolight);
draw(D--C--A--B--cycle,green);

path3 q34=(C -- D -- rotate(-56,X)*(D+Y) -- rotate(-56,X)*(C+Y) -- cycle);
surface sq34=surface(q34);
draw(sq34,green+opacity(.6),light=nolight);
draw(C -- D -- rotate(-56,X)*(D+Y) -- rotate(-56,X)*(C+Y) -- cycle,green);

path3 q22=(C -- D -- rotate(-28,X)*(D+Y) -- rotate(-28,X)*(C+Y) -- cycle);
surface sq22=surface(q22);
draw(sq22,blue+opacity(.6),light=nolight);
draw(C -- D -- rotate(-28,X)*(D+Y) -- rotate(-28,X)*(C+Y) -- cycle,blue);

path3 q12=(D -- C -- E -- F -- cycle);
surface sq12=surface(q12);
draw(sq12,red+opacity(.6),light=nolight);
draw(q12,red);

surface s4=surface(pl3);
draw(s4,yellow+opacity(.2),light=nolight);
draw(pl3,yellow);

path3 q32=(rotate(-56,X)*(D-Y) -- rotate(-56,X)*(C-Y) -- A -- B -- cycle);
surface sq32=surface(q32);
draw(sq32,green+opacity(.6),light=nolight);
draw(rotate(-56,X)*(D-Y) -- rotate(-56,X)*(C-Y) -- A -- B -- cycle,green);

path3 q13=(Y -- C+Y -- E -- F -- cycle);
surface sq13=surface(q13);
draw(sq13,red+opacity(.6),light=nolight);
draw(Y -- C+Y -- E -- F -- cycle,red);

dot(A,red);
dot(B,red);
dot(C,red);
dot(D,red);
dot(E,red);
dot(F,red);

//From Charles Staats's tutorial
//Direction of a point toward the camera.
triple cameradirection(triple pt, projection P=currentprojection) {
  if (P.infinity) {
    return unit(P.camera);
  } else {
    return unit(P.camera - pt);
  }
}

//Move a point closer to the camera.
triple towardcamera(triple pt, real distance=1, projection P=currentprojection) {
  return pt + distance * cameradirection(pt, P);
}

label("$A$",align=NE,position=towardcamera((A)));
label("$B$",align=S,position=towardcamera((B)));
label("$C$",align=SE,position=towardcamera((C)));
label("$D$",align=SW,position=towardcamera((D)));
label("$E$",align=NE,position=towardcamera((E)));
label("$F$",align=S,position=towardcamera((F)));

