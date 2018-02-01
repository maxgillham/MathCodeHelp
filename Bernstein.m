%included for large number of polynomial estimations (variable n)
warning('off','all')
%domain interval from 0 to 1 inclusivly
x = 0:.001:1;
%number of Bernstein approximations
n=100;
l = bern(n,x);
f = fun(x);
%plot Bernstien approximation of given function and given function
figure
hold on
plot(x,l)
plot(x,f)
%returns coefficients of a polynomial of degree deg fitted to Bernstien
%approximation
deg = 10;
coefficients = polyfit(x,l,deg)
%calculate supremum difference
m = abs(f - l);
supremum = max(m)

function b = bern(n,x)
g = fun(x);
plot (x,g)
hold on
g = 0;
%sums n approximations and plots each approximation component with input function
for i = 0:n
    g = g + fun(i/n)*(nchoosek(n,i))*(x.^i).*((1-x).^(n-i));
    plot(x,g)
    pause(0.05)
end
%returns the approximated function as points with respect to interval x
b = g;
end

%function to be approximated goes here, must be an element of C([0,1])
function f = fun(x)
f = 10*sin(2*pi*x);
%f = 2*sin((pi/4)*x)+3*cos((pi/2)*x);
end
