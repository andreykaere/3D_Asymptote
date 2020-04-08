settings.outformat = "pdf";
settings.prc = false;  // IMPORTANT
settings.render = 0;   // IMPORTANT
import three;
size(10cm, 0);
//projection P = orthographic((0,8,9));
//currentprojection=P;

void opendot(picture pic=currentpicture, triple v, material p=currentpen,
         light light=nolight, string name="", render render=defaultrender)
{
  pen q=(pen) p;
  pen fillpen = light.background;
  if (invisible(fillpen)) fillpen = currentlight.background;
  if (invisible(fillpen)) fillpen = white;
  real size=0.5*linewidth(dotsize(q)+q);
  pic.add(new void(frame f, transform3 t, picture pic, projection P) {
      write(t);
      triple V=t*v;
      assert(!is3D(), "opendot() not supported unless settings.prc == false and settings.render != 0");
      if(pic != null)
        dot(pic,V, red);
        dot(pic,project(V,P.t),filltype=FillDraw(fillpen=fillpen, drawpen=q));
    },true);
  triple R=size*(1,1,1);
  pic.addBox(v,v,-R,R);
}

void opendot(picture pic=currentpicture, Label L, triple v, align align=NoAlign,
             string format=defaultformat, material p=currentpen,
             light light=nolight, string name="", render render=defaultrender)
{
  Label L=L.copy();
  if(L.s == "") {
    if(format == "") format=defaultformat;
    L.s="("+format(format,v.x)+","+format(format,v.y)+","+
      format(format,v.z)+")";
  }
  L.align(align,E);
  L.p((pen) p);
  opendot(pic,v,p,light,name,render);
  label(pic,L,v,render);
}

dotfactor *= 1.3;  // Make dots twice as big as they are by default.
real a=3;
real b=4;
real c=4;
triple A=(0,0,a);
triple B=(0,b,0);
triple C=(c,0,0);
draw(A--B--C--A,linewidth(1));
draw(O--A^^O--B^^O--C,dashed);
path3 p=O--(6,6*c/b,0);
path3 q=B--C;
path3 p1=O--(6,0,6*c/a);
path3 q1=A--C;
triple H1=intersectionpoint(p,q);
triple H2=intersectionpoint(p1,q1);
path3 h1=A--H1;
path3 h2=B--H2;
triple H=intersectionpoint(h1,h2);
draw(h1);
draw(h2);
draw(O--H);
opendot(Label("$H_1$",align=W),H2);
opendot(Label("$H_2$",align=S),H1);
opendot(Label("$H$",align=NE),H);
opendot(Label("$A$",align=N),A);
opendot(Label("$B$",align=E),B);
opendot(Label("$C$",align=W),C);
opendot(Label("$O$",align=S),O);

//write(P.t);


//for (real[] i: scene.t) {
    //write(i);
//    for (real j: i) {

//    }
//}
//write(P.target);
