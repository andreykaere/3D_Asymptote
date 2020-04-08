settings.outformat = "pdf";

size(8cm);


pen Dotted(pen p=currentpen) {
return linetype(new real[] {0,3})+2*linewidth(p);
}
//pen Dotted=Dotted();

path g = (0,1)..(1,0)..(0,-1)..(-1,0)..cycle;

path f = (0,0.5)..(1,0)..(0,-0.5)..(-1,0)..cycle;

//path f = circle((0,1), 0.5);
path g = circle((1,0), 1.5);
path f = ellipse((1,0), 1.5, 0.5);

//dot(point(f, 1));
//dot(point(f, 2));
draw(g);
//draw(f);

int j = 0;
real [][] r = intersections(g, f);
for (real [] i: r) {
//dot((string)j, i);
//dot(,blue);
write(i);j+=1;}

dot(point(f,r[1][1]));

//draw(subpath(f, 0.5,.6));
draw(subpath(f, r[0][1],r[1][1]),Dotted(linewidth(1)));
draw(subpath(f, r[1][1],length(f)));
//write(length(f));

dot(r[0][0],blue);
dot(r[0][1],blue);
dot(r[1][1],blue);
dot(r[1][0],blue);

//draw(f, red+Dotted(linewidth(1)));
//draw(subpath(f,r[0][1], r[1][1]), red);
//draw(subpath(f,r[1][0], r[0][0]), blue+Dotted(linewidth(1)));


//draw(r[0]..r[1], dashed);
//draw(lastcut(f, g).before, red);
//draw(firstcut(f, g).after, blue);

