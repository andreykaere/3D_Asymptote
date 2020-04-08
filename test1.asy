settings.render = 0;
settings.outformat = "pdf";

import three;
size(8cm, 0);

path3 g=(1,0,0)..(0,1,1)..(-1,0,0)..(0,-1,1)..cycle;

pair A = (4, 5);
dot("A", A);
dot("B", invert(A));

draw(g);
draw(project(g, Z, (0,0,0), (0,0,0)), blue);
