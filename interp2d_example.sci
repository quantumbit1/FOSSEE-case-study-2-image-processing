n = 15;  // a n x n interpolation grid

//re = rand(1,n);
x = linspace(0,2*%pi,n); y = x;
z = cos((cos(x'))*(cos(y))).^2;
C = splin2d(x, y, z, "periodic");

// now evaluate on a bigger domain than [0,2pi]x [0,2pi]
m = 800; // discretization parameter of the evaluation grid
xx = linspace(-0.5*%pi,2.5*%pi,m); yy = xx;
[XX,YY] = ndgrid(xx,yy);
zz4 = interp2d(XX,YY, x, y, C, "natural");
//plot3d(xx, yy, zz4, flag=[2 6 4])
//xtitle("extrapolation with the natural outmode")
