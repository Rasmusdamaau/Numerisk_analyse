% create vector of n equally spaced points in [a,b]
n = 15;
a = -10;
b = 10;
x=linspace(a,b,n);
% compute corresponding y-values
y=1./(1+x.^2);
% compute n'th-degree interpolating polynomial
p=polyfit(x,y,n-1);
% for plotting, create vector of 100 equally spaced points
xx=linspace(a,b);
% compute corresponding y-values to plot function
yy=1./(1+xx.^2);
% plot function
plot(xx,yy)
% tell MATLAB that next plot should be superimposed on
% current one
hold on
% plot polynomial, using polyval to compute values
% and a red dashed curve
plot(xx,polyval(p,xx),'r--')
% indicate interpolation points on plot using circles
plot(x,y,'o') % label axes
xlabel('x')
ylabel('y')
% set caption
title('Runge’s example')