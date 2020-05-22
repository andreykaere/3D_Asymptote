settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;
import patterns;
real H=5mm;


import graph3;  
size(300,keepAspect=true);    
currentprojection=orthographic(10,10,30);
currentlight=nolight;

draw((-1.2X)--1.2X,Arrow3);
draw((-1.2Y)--1.2Y,Arrow3);
draw((-1.2Z)--1.2Z,Arrow3);

surface sphericaltriangle(triple center=O, triple A=(1,0,0),triple B=(0,1,0),triple C=(0,0,1),int ns=10,int nt=ns){
    path3 tri1=Arc(center,A,B,nt);
    path3 tri2=Arc(center,A,C,ns);
    path3 tri3=Arc(center,B,C,ns);
    triple tri(pair p){
        path3 cr=Arc(O,relpoint(tri2,p.x),relpoint(tri3,p.x));
        return relpoint(cr,p.y);
    };
   
    return surface(tri,(0,0),(1-0.0001,1),ns,nt,Spline);
   
}


add("hatch", hatch(2mm, linewidth(0.1)));
add("hatchback",shift(H*sqrt(2))*rotate(90)*hatch(2mm, linewidth(0.1)));


surface triangle=sphericaltriangle(A=(1,0,0),B=unit((-0.5,1,-0.25)),C=unit((-0.5,0,1)),ns=10,nt=10);
draw(triangle,pattern("hatchback"));//surfacepen=orange,meshpen=nullpen);
//surface triangle1=sphericaltriangle(A=(1,0,0),B=unit((-0.5,1,-0.25)),C=unit((0.5,0,-1)),ns=10,nt=10);
//draw(triangle1,surfacepen=red,meshpen=nullpen);
//surface triangle2=sphericaltriangle(A=(1,0,0),B=unit((0.5,0,-1)), C=unit((-1,-1,-1)),ns=10,nt=10);
//draw(triangle2,surfacepen=blue,meshpen=nullpen);
