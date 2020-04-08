settings.render = 0;
settings.prc = false;

import three;

projection[] projections;
projections.push(perspective(3*(-7,4.5,9),up=Y));
projections.push(perspective(3*(-7,4.5,9),up=Y,autoadjust=true,center=false));
projections.push(orthographic((-1.5,0.4,1),(0,1,0)));
frame final;
real y=0;
for(projection P : projections) {
  picture pic;
  unitsize(pic,1cm);

  draw(pic,(0,0,-5)--(0,0,20),red);
  for(real z=0; z <= 15; z += 5) {
    draw(pic,(0,0,z)--(0,1,z),blue,EndArrow3);
    label(pic,XY*Label("text"),(0,1,z),heavygreen);
  }
  y -= 300;
  add(final,pic.fit(P),(0,y));
}
erase();
attach(final);
