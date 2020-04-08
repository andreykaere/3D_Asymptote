size(8cm,0);
import solids;

settings.render=0; // à commenter si besoin
settings.prc=false; // à commenter si besoin
//------------------------------------------------------------------------------------------
// v "direction" de la flèche de cotation, si cc=false le label change de côté
void cote3D(picture pic=currentpicture,
		Label L="", triple A, triple B, real d=5mm, triple v, bool cc=true,
		pen p=currentpen, pen joinpen=dotted){
	transform3 T=shift(d*unit(v));
	triple A=A, B=B;
	pic.add(new void(picture f, transform3 t) {
		picture opic;
		path3 dist;
		triple Ap=t*A, Bp=t*B;
		triple a=T*Ap, b=T*Bp;
		if (cc) {dist=a--b;}
		else {dist=b--a;}
		draw(opic,L,dist,p,Arrows3);
		draw(opic,a--Ap^^b--Bp,joinpen);
		add(f,opic);
	}, true);
}
//-----------------------------------------------------------------------------------------

//////////////////// Définition des objets ////////////////////

//------------------ VALEURS À MODIFIER -----------------------
real R=4, h=-2.5; // rayon de la sphère, hauteur de la section
real ang=0; // angle {(-i)O'A} du diamètre de la section
pen pSphere=brown; // couleur et épaisseur du tracé de la sphère
pen pSeg=brown+linetype("4 4"); // couleur et épaisseur du tracé des segments
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
calotte.transverse(s,reltime(calotte.g,0));
path3 sol=shift(-2.5*Z)*plane(18*Y, -12*X, (6,-9,0)),
	c=shift(-2.5*Z)*scale3(3.12)*unitcircle3;
//------------------ Tracés --------------------
draw(s.transverse.front,pSphere); // tracé section
draw(surface(calotte),brown+opacity(.4));
draw(surface(reverse(c)^^sol,planar=true),brown+opacity(.4)); // plan avec un trou
//------------------ Cotes --------------------
triple Tpole=shift((pB-pA)/2)*pole;
cote3D(scale(.8)*"$5$~cm",pA,pB,5*mm,Z,brown,dotted+brown);
cote3D(scale(.8)*"$1$~cm",pB,Tpole,2*mm,X,brown,dotted+brown);
draw(pole--Tpole,dotted+brown);

shipout(bbox(1mm,invisible));
