import solids;
settings.render = 0;
settings.outformat="pdf";
size(8cm);

currentprojection=orthographic(2*(1,1,1));

real r=4, h=7;
triple O=(0,0,0);
triple Oprime=(0,0,3);
triple pS=(0,0,h);
triple pA=(r*sqrt(2)/2,r*sqrt(2)/2,0);
revolution rC=cone(O,r,h,axis=Z,n=1);

//draw(cone((0,0,0),r=1,h=2,n=1));
draw(rC.silhouette(500));
//draw(rC.longitudinal.front);
//draw(rC);
//draw(surface(rC));
//draw(rC.g,red);

skeleton s;
real tOprime=abs(Oprime)/h;
rC.transverse(s,reltime(rC.g,tOprime), currentprojection);
//rC.transverse(s,.5, currentprojection);
triple pAprime=relpoint(pA--pS,tOprime);

draw(s.transverse.back,dashed);
draw(s.transverse.front);

label("$S$",pS,N);
dot(Label("$O$",align=SE),O, UnFill);
dot(Label("$O'$",align=SE),Oprime);
dot(Label("$A$",align=Z),pA);
dot(Label("$A'$",align=Z),pAprime);

draw(pS--O^^O--pA^^Oprime--pAprime,dashed);

