import settings;
gs = "/home/andrey/bin/gs";

settings.outformat = "svg";
settings.prc = false;
//settings.render = 16;
size(10cm, 0);  // Final image will be 10cm wide, unlimited height.
import three;   // Enable three-dimensional functionality.
currentprojection = orthographic(2,5,1);

draw(unitsphere, red);
draw(surface((-2,-2,0) -- (-2,2,0) -- (2,2,0) -- (2,-2,0) -- cycle), blue);

/*settings.outformat = "png";
settings.render = 8;
size(10cm, 0);  // Final image will be 10cm wide, unlimited height.
import three;   // Enable three-dimensional functionality.
currentprojection = orthographic(2,5,1);
*/
draw(unitsphere, red);
draw(surface((-2,-2,0) -- (-2,2,0) -- (2,2,0) -- (2,-2,0) -- cycle), blue + opacity(0.5));
