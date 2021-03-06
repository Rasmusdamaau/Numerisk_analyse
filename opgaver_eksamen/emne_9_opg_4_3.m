
p = @(x) 816*x.^3 - 3835*x.^2 + 6000*x - 3125;
pprime = @(x) 3*816*x.^2 - 2*3835*x + 6000;

%% a. eksakte rødder
poly = [816 -3835 6000 -3125];
r = roots(poly)

%% b. plot

fplot(p,[1.43,1.71]);
hold on, plot(r,zeros(3,1),'o');
hold off;

%% c. newtons metode

xprev = 0;
x = 1.5;
k = 0;
while abs(x - xprev) > eps*abs(x)
    xprev = x;
    x = x - p(x)/pprime(x)
    k = k + 1;
end
k

%% d. sekant metode

a=1;
b=2;

while abs(b-a) > eps*abs(b)
    c = a;
    a = b;
    b = b + (b - c)/(p(c)/p(b)-1)
    k = k + 1;
end

k

%% e. bisektion

a = 1;
b = 2;
k = 0;
while abs(b-a) > eps*abs(b)
    x = (a + b)/2;
    if sign(p(x)) == sign(p(b))
        b = x;
    else
        a = x;
    end
    k = k + 1;
end
a
k


%% f. fzerotx

b = fzerotx(p, [1,2]);

steps = fzerogui(p, [1,2])

%% ingen finder miderste rod

