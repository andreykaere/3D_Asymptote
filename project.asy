settings.outformat = "pdf";
settings.prc = false;
settings.render = 8;

import three;
import solids;
import graph3;

size(8cm, 0);
//currentprojection=oblique;
//projection P = currentprojection;

limits(2*(-1,-1,-1),2*(1,1,1));
xaxis3("$x$",Arrow3);
yaxis3("$y$",Arrow3);
zaxis3("$z$",Arrow3);

currentprojection=orthographic((4,-5,2));
projection P = currentprojection;
picture pict = currentpicture;

//write(pict.T);

//pict.add(new void(frame f, transform3 t,){}, true);

triple A = (4,1,3);

revolution b=sphere((0,0,0),1);


dot((0,0,1));
dot((0,1,0));
dot((1,0,0));
dot((0,0,-1));
dot((0,-1,0));
dot((-1,0,0));


draw(surface(b), red+opacity(0.9));
draw(b.silhouette());
/*
triple proj(picture pic=currentpicture, triple v, projection P = currentprojection) {
    triple V;
    pair R;
    pic.add(new void(frame f, transform3 t, picture pic, projection P) {
       write(1);
       write(t);
       write(2);
       write(pic.calculateTransform3());
       V=t*v;
       if (pic != null) 
           //write(V);
           //write(pic);
           //dot(pic, "$V$", V);
           dot(pic, V, linewidth(0));
           //write(project(V, P.t));
           //dot(pic, project(V, P.t));
       }, true);        
    
    write("V");
    write(V);
    write("V");
    
    return V;
    //write(t);
    //triple V=t*v;
    //return V;   
}
//transform3 r = scene.t;
//transform3 r = identity4;

dot("$A$", A);

//dot("$A'$", project(proj(A), P.t));
//dot("$A'$", project(r*A, P.t));
dot("$B'$", project(A, P.t));
dot("$C'$", project(A));
write(project(A));

dot("$T$", (3.74817028532655,2.35138199575758));
//write(nodes3);
*/

//transform3 r = P.t;
//dot(project(r*A));
//dot("$A''$",project(r*A, P.t), red*2);
//proj(A);
//revolution b=sphere((1,1,1),0.5); // Used because of silhouette()

//draw(b,1);
//draw(b.silhouette()); 

//draw(b.skeleton(m,n,inverse(t)*P));

//path3 s = b.silhouette()[0]..b.silhouette()[1]..cycle;

//draw(s, red);

// Used because of silhouette()uu
//path3 g = (0,0,1) .. (1,0,0) .. (0,1,0) ..(0,0,-1)..cycle;

//draw(g);
//dot(g, red);
