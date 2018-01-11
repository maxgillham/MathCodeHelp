
x = linspace(-2,2,14);
y = linspace(-2,2,14);

[X,Y] = meshgrid(x,y);

U = 4.*X - 1.*Y; % dx/dt
V = 4.*X; % dy/dt

quiver(X,Y,U,V)
