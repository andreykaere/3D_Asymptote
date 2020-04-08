import three;
import graph3;
size(5cm);

defaultrender.tubegranularity=0.0005;

settings.render = 0;
settings.outformat = "pdf";



import solids;
import three;
size(6cm);

real zenith  = pi/12.0;
real azimuth = pi/12.0;
//currentprojection = perspective(cos(azimuth)*cos(zenith),
//                                sin(azimuth)*cos(zenith),
//                                sin(zenith));
real r = 1;
real ar = 1.2;

path3 myarc = Arc(c=O,normal=X, v1=-Z*r, v2=Z*r, n=12);
surface sphere = surface(myarc, angle1=0, angle2=360, c=O, axis=Z, n=12);

draw((0,0,  0)--(ar,0,0),   red+linewidth(1pt));
draw((0,0,  0)--(0,ar,0), green+linewidth(1pt));
draw((0,0,-ar)--(0,0,ar),  blue+linewidth(1pt));

label("$S$",(0,0,-ar),S);
draw(sphere, surfacepen=material(white+opacity(1)));
label("$N$",(0,0,ar),N);

pair[] region = new pair[] {(-10,0),(0,10),(10,0),(0,-10),(-10,0)};
for(int i=1; i<region.length; ++i){
  pair one, two;
  if(region[i-1].y < region[i].y){
    one = (region[i]  .x, 90 - region[i]  .y);
    two = (region[i-1].x, 90 - region[i-1].y);
  }else if(region[i-1].y > region[i].y){
    one = (region[i-1].x, 90 - region[i-1].y);
    two = (region[i]  .x, 90 - region[i]  .y);
  }else if(region[i-1].x > region[i].x){
    one = (region[i]  .x, 90 - region[i]  .y);
    two = (region[i-1].x, 90 - region[i-1].y);
  }else{
    one = (region[i-1].x, 90 - region[i-1].y);
    two = (region[i]  .x, 90 - region[i]  .y);
  }
  path3 temp = arc(O,r,one.y,one.x,two.y,two.x);
  draw(temp,black+linewidth(.5pt));
}
/*import solids;
unitsize(4cm);

currentprojection=perspective( camera=(1,.4,.9), target = (0,0,0));
currentlight=nolight;

revolution S=sphere(O,1);
//draw(surface(S),surfacepen=lightgrey+opacity(.6),meshpen=0.6*white+linewidth(.5pt));
pen LineStyle1 = rgb(0.3,0.3,1)+linewidth(1.5pt)+opacity(1);

dot(S.c);
draw(surface(S),surfacepen=lightgrey+opacity(.4), 
meshpen=green+linewidth(0.00001));
*/
/*
dot((1,0,0),LineStyle1);
dot((0.99992,0.012295,0.00023746),LineStyle1);
dot((0.9997,0.024582,0.00094946),LineStyle1);
dot((0.99932,0.036854,0.002135),LineStyle1);
dot((0.99879,0.049104,0.0037921),LineStyle1);
dot((0.9981,0.061324,0.0059185),LineStyle1);
dot((0.99726,0.073506,0.0085108),LineStyle1);
dot((0.99626,0.085643,0.011565),LineStyle1);
dot((0.9951,0.097727,0.015077),LineStyle1);
dot((0.99378,0.10975,0.019041),LineStyle1);
dot((0.99229,0.1217,0.023452),LineStyle1);
*/
/*
settings.render = 16;
settings.outformat = "png";

currentlight = light(diffuse  = new pen[] {cyan, orange},
                     specular = new pen[] {black, white},
                     position = new triple[] {-Y+Z, X+Y});

draw(unitsphere, surfacepen=white);
*/
/*
real x=2, y=3, z=5;
real r=4;

//draw(unitsphere, red+opacity(.2));

path3 g=(1,0,0)..(0,1,0)..(-1,0,0)..(0,-1,0)..(0,0,1)..(0,0,-1)..cycle;
draw(g);

draw(((-1,-1,0)--(1,-1,0)--(1,1,0)--(-1,1,0)--cycle));

*/
