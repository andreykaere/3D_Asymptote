
settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;
import graph3;
import solids;

currentlight=Headlamp;

size(10cm,0);

// Draw a sphere of radius 1 centered at the origin
real radius_sphere = 1;
triple center_sphere = (0,0,0);
revolution sph = sphere(center_sphere,radius_sphere);
draw(surface(sph),lightred+opacity(0.5));

// Start with the plane Ax+By+Cz=D, then normalize the
// coefficients by dividing by sqrt(A^2+B^2+C^2). This will
// produce the same plane with normalized coefficients
// ax+by+cz=d. In this case, one can show that the distance
// between the plane ax+by+cz=d is equal to d, provided
// d is nonnegative
real A=1/2, B=1/2, C=1, D=1;
real a=A/sqrt(A^2+B^2+C^2),
b=B/sqrt(A^2+B^2+C^2),
c=C/sqrt(A^2+B^2+C^2),
d=D/sqrt(A^2+B^2+C^2);

// A little geometry shows that the radius of the circle
// of intersection is as follows.
real radius_circle=sqrt(radius_sphere^2-d^2);

// Thus the center of the circle of intersection is located
// as follows.
triple center_circle=(d*a,d*b,d*c);

// And a vector normal to the circle of intersection is
// as follows.
triple normal_vector=(a,b,c);

// We can now draw the circle of intersection.
path3 circ=circle(center_circle,radius_circle,normal_vector);
draw(circ,red);

// Add some axes
limits((-2,-2,-2),(2,2,2));
xaxis3("$x$",Arrow3);
yaxis3("$y$",Arrow3);
zaxis3("$z$",Arrow3);

// Label the north pole
dot(Label("$N$",align=N),(0,0,1));

// The vector (-c,0,a) is orthogonal to the normal vector
// (a,b,c) and taking the cross product of (-c,0,a) and the
// normal vector (a,b,c) produces another vector orthogonal
// to the normal vector, namely (ab,-a^2-b^2,bc). Dividing
// each of these by their lengths provides unit vectors.
triple u=(-c,0,a), v=(a*b,-a^2-c^2,b*c);
u=u/abs(u);
v=v/abs(v);

// Create a plane spanned by the vectors u and v and passing
// through the origin.
path3 p=plane(u,v,(0,0,0));

// Scale the plane by 2, shift it so that it is centered
// at the origin, then shift it so that it is centered
// at the center of the circle.
p=scale3(2)*p;
p=shift(-u-v)*p;
p=shift(center_circle)*p;
draw(surface(p),lightblue); 
