//import three;
import solids;
unitsize(2.5inch);
//size(5inch);
settings.outformat = "pdf";
settings.render=0;
settings.prc=false;

currentprojection=orthographic(3, 1, 1);
currentlight=nolight;

real RE=0.6, RS=0.7, inc=100, lat=45, lon=45, tlat=50, tlon=100;

revolution Earth=sphere(0, RE, n=4*nslice);
//Added specification for mesh pen
draw(surface(Earth), surfacepen=lightgrey+opacity(.6), meshpen=0.6*white);
//The next line is no longer necessary.
//draw(Earth,m=10,gray);
