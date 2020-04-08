size(7cm,0);
import solids;
settings.outformat = "pdf";
settings.render=0;
settings.prc=false;
//------------------------------------------------------------------------------------------
// Draw right angle (MA,MB) in 3D -- Fonction de Philippe Ivaldi
void drawrightangle(picture pic=currentpicture,
                    triple M, triple A, triple B,
                    real radius=0,
                    pen p=currentpen,
                    pen fillpen=nullpen,
                    projection P=currentprojection)
{
  p=linejoin(0)+linecap(0)+p;
  if (radius==0) radius=arrowfactor*sqrt(2);
  transform3 T=shift(-M);
  triple OA=radius/sqrt(2)*unit(T*A),
    OB=radius/sqrt(2)*unit(T*B),
    OC=OA+OB;
  path3 _p=OA--OC--OB;
  picture pic_;
    draw(pic_, _p, p=p);
    if (fillpen!=nullpen) draw(pic_, surface(O--_p--cycle), fillpen);
  add(pic,pic_,M);
}
//-----------------------------------------------------------------------------------------

//////////////////// Définition des objets ////////////////////

//------------------ VALEURS À MODIFIER -----------------------
real R=4, h=-2.5; // rayon de la sphère, hauteur de la section
real ang=40; // angle {(-i)O'A} du diamètre de la section
pen pSphere=bp+purple; // couleur et épaisseur du tracé de la sphère
pen pSeg=bp+linetype("4 4")+deepmagenta; // couleur et épaisseur du tracé des segments
Label LA="$A$", LO="$O$", LO2="$O'$", LR="$R$", Lh="$h$", Lr="$r$";
// camera : x à gauche, y devant, z en haut
currentprojection = orthographic(10,70,15); // changer z pour l'aplatissement de l'ellipse
//-------------------------------------------------------------

triple pO=(0,0,0), pO2=(0,0,h); // pO : centre de la sphère, pO2 : centre de la section
triple xSec=(-sqrt(R^2-h^2),0,h); // point A avant rotation
transform3 T=rotate(ang,Z), t=rotate(180,Z);
triple pA=T*xSec, pB=t*pA; // diamètre de la section
triple pole=(h>0)? (0,0,R) : (0,0,-R);
path3 gene=arc(pO,xSec,pole); //génératrice

revolution calotte=revolution(pole,gene,axis=Z,0,360);
skeleton s;
calotte.transverse(s,reltime(calotte.g,0), currentprojection);

//------------------ Tracés (commenter ce qui n'est pas voulu) --------------------

draw(calotte.silhouette(),pSphere);  // Calotte
draw(s.transverse.back,pSphere+linetype("4 4"));
//draw(surface(calotte),lightmagenta); // +opacity(.4)

if (h>0){
draw(Lh,pO2--pO,pSeg);
draw(Lr,pA--pO2,pSeg);
draw(LR,pO--pA,pSeg);}
else {
draw(Lh,pO--pO2,pSeg);
draw(Lr,pO2--pA,pSeg);
draw(LR,pA--pO,pSeg);}

drawrightangle(pO2,pO,pA,radius=5mm);

////---------------- labels ------------------
dot(Label(LO,align=unit(pO-pA)),pO);
dot(Label(LA,align=NE),pA);
dot(Label(LO2,align=unit(pO2-pA)),pO2);
//------------------------------------------
shipout(bbox(1mm,invisible));
