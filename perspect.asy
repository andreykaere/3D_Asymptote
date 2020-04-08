settings.render = 0;
settings.prc = false;
settings.outformat = "pdf";

import graph3;
import solids;
size (8cm, 0);
currentprojection=orthographic(10*2,0.5*2,6*2);
//currentprojection=perspective(10*2,0.5*2,0);
//currentprojection=perspective(-5,-2,3);
dotfactor=2.5;
//grid3(gridroutine=XYXgrid(),Step=1,step=.5);

pen def_front=cmyk(black)+linewidth(.5);
pen def_front_red=cmyk(red)+linewidth(.3);
pen def_back=gray(.5)+dotted+linewidth(.3)+linetype(new real[] {4,2});
pen def_back_solid=gray(.5)+linewidth(.3);
pen def_back_red=cmyk(red)+dotted+linewidth(.3)+linetype(new real[] {4,2});

real x_centre = 1.5;
real y_centre = 1.5;
real rad = 1;
triple vertex=(0,0,1);
path p2 = (x_centre,y_centre-rad)..(x_centre+rad,y_centre)..(x_centre,y_centre+rad)..(x_centre-rad,y_centre)..cycle;
path3 p = path3(p2);

//currentlight=light(white,(2,2,2),(2,-2,-2));
//currentlight=nolight;

surface sph=shift(0,0,.5)*scale3(.5)*unitsphere;
revolution b=sphere((0,0,0.5),0.5); // Used because of silhouette()
//path3 line=(0,0,1)--(1,1,0);
//triple[] tmp;
//tmp[0]=(1,1,1); // Just to make sure I understand how arrays work :)
//tmp=intersectionpoints(line,sph,1e-4); // Asymptote freezes on this line

draw(b,1,frontpen=def_front,backpen=def_back,longitudinalpen=nullpen); // Draw equator

//draw(b.skeleton.transverse.back[0], red);
draw(p,def_front_red); // Draw the circle in the plane

//draw(sph, gray+opacity(0.6));

triple[] inter;
int cntr = 0;
for (int i = 0; i < size(p2); ++i)
{
    path3 intray=point(p,i)--vertex;
    triple[] tmp=intersectionpoints(intray,sph,1e-4);
    for (int j=0; j<tmp.length; ++j)
    {
        inter.push(tmp[j]);
    }
    draw(point(p,i)--inter[cntr],def_back_solid);
    draw(inter[cntr]--vertex,def_back);
    cntr = cntr + 2;
}

//draw((path3)(inter[0]..inter[2]..inter[4]..inter[6]..cycle),frontpen=def_front_red, backpen=def_back_red);
//draw(sph,surfacepen=material(diffusepen=0.5*blue + opacity(0.5), emissivepen=0.5*white));
//draw(line);
//dot(inter[0],2bp+deepgreen);
//dot(inter[2],2bp+deepgreen);
//dot(inter[4],2bp+deepgreen);
//dot(inter[6],2bp+deepgreen);


draw(b.silhouette(),def_front);
draw(inter[2]--point(p,1),def_back_solid); // Correct the incorrect overlap of the red circle and the lines
draw(inter[4]--point(p,2),def_back_solid);
draw(inter[6]--point(p,3),def_back_solid);
draw((3,-1.5,0)--(3,3,0)--(-2.5,3,0)--(-2.5,-1.5,0)--cycle,def_back_solid);

cntr = 0;
for (int i = 0; i < size(p2); ++i)
{
    dot(point(p,i),cmyk(red));
    dot(inter[cntr],cmyk(red));
    cntr = cntr + 2;
}
//draw(XYplane);
