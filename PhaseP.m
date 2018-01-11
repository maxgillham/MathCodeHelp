

[X,Y] = meshgrid(x,y);
%function here
U = 4.*X - 1.*Y; % dx/dt
V = 4.*X; % dy/dt

x = linspace(-2,2,14);
y = linspace(-2,2,14);

quiver(X,Y,U,V)
