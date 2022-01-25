
p = @(x) 816*x.^3 - 3835*x.^2 + 6000*x - 3125;

%% a
poly = [816 -3835 6000 -3125];
r = roots(poly)

%% b

fplot(p,[1.43,1.71]);
hold on, plot(r,zeros(3,1),'o');
hold off;

%% f

b = fzerotx(p, [1,2]);

steps = fzerogui(p, [1,2])