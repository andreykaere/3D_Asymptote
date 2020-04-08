import three;
import solids;

settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;

size(0, 200);

currentprojection=orthographic((1.5, -0.8, 1.0)); //oblique;

guide3[] flume = box((0, 0, 0), (1, 3, 1.5));
revolution r = cylinder ((3, 1.5, 0.75), 0.16, 1.8, X);

path3 water1 = (0, 0, 1.1)--(1, 0, 1.1)--(1, 3, 1.1);
path3 water2 = (1, 3, 1.1)--(0, 3, 1.1)--(0, 0, 1.1);
path3 laser = (3, 1.58, 0.75)--(1, 1.5, 0.75)--(3, 1.42, 0.75);
path3 water_level1 = (0.5, 0, 1.1)--(0.35, 0, 1.25)--(0.65, 0, 1.25)--cycle;
path3 water_level2 = (0.4, 0, 1)--(0.6, 0, 1);
path3 water_level3 = (0.45, 0, 0.9)--(0.55, 0, 0.9);
path3 line1 = (4.8, 1.5, 0.75)..(5.2, 1.47, 0.5)..(5.2, 1.47, 0.27)..(5.3, 1.47, 0)
;
path3 line2 = (4.8, 1.5, 0.75)..(5.2, 1.53, 0.5)..(5.2, 1.53, 0.27)..(5.3, 1.53, 0)
;

//draw(flume);
r.draw();
draw(water1);
draw(water2, dashed);
draw(water_level1);
draw(water_level2);
draw(water_level3);
draw(laser);
draw(line1);
draw(line2);
draw(Label("Flow",1),(0.5, 1.2, 0.55)--(0.5, 1.8, 0.55), Arrow);
label("Flume", (1, 3, 1.2), SE);
label(minipage("2D laser probe", 45pt), (5, 1, 0.65), NW);
