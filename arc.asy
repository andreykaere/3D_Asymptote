import three;
import graph3;
size(10cm);

settings.outformat = "pdf";
settings.render = 0;

pen solid=linetype(new real[]);
pen longdashed=linetype(new real[] {10,8});
pen dashed=linetype(new real[] {3,8});

currentprojection=perspective(1/2,-1/4,1/4.4);

pen bg=gray(0.9)+opacity(0.1);
draw(surface((0,0,0.5)--(1,0,0.5)--(1,1,0.5)--(0,1,0.5)--cycle),bg);

draw((0,0,0)--(1,0,0), solid);
draw((0,0,0)--(0,1,0), longdashed);
draw((1,0,0)--(1,1,0), solid);
draw((0,1,0)--(1,1,0), longdashed);
draw((0,0,1)--(1,0,1), solid);
draw((0,0,1)--(0,1,1), solid);
draw((1,0,1)--(1,1,1), solid);
draw((0,1,1)--(1,1,1), solid);
draw((0,0,0)--(0,0,1), solid);
draw((1,0,0)--(1,0,1), solid);
draw((1,1,0)--(1,1,1), solid);
draw((0,1,0)--(0,1,1), longdashed);
draw((0.5,0,0.5)--(0.5,1,0.5));
draw((0,0.5,0.5)--(1,0.5,0.5));
draw((0,0,0)--(1,1,1),dashed);
draw((1,0,0)--(0,1,1),dashed);

// Blue vectors
guide3 v1=(0.5,0.5,0.5)--(1,0.5,0.5);
guide3 v2=(0.5,0.5,0.5)--(1,1,1);
draw(v1,blue,Arrow3);
draw(v2,blue,Arrow3);
guide3 alphaArc=arc(point(v1,0),point(v1,0.5),point(v2,0.5));
draw(alphaArc,red,Arrows3);

dot("$v_1$",point(v1,1));
dot("$v_2$",point(v2,.5));

label("$\alpha$",alphaArc,SE);
label("$e_1$",point(v1,1),SE);
label("$e_2$",point(v2,1),SE);
