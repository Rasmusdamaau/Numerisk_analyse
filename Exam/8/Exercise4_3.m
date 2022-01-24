%Exercise 4.3 regarding roots of the following polynomial p
p = poly2sym([816 -3835 6000 -3125]);
pc= [816 -3835 6000 -3125];

%a) Exact roots of p.
z = solve(p);
roots = sort(double([z(1),z(2),z(3)]));
disp(['a) The roots of p are ' num2str(roots(1)) ', ' num2str(roots(2)) ...
     ' and ' num2str(roots(3))])


%b) Plot p for 1.43≤x≤1.171 and location of the roots.
ezplot(p,[1.43,1.71])
hold on, plot(double(z),zeros(3,1),'o') %Double for double-precision

%c) Newton's method starting with x0 = 1.5
dp  = poly2sym([816*3 -3835*2 6000]);
dpc = [816*3 -3835*2 6000];

x = 1.5;        %Starting value
nmax = 25;      %Maximum number of iterations
error = 1;        %Error bound
xvals = x;      %Iterations of x
n = 0;
while error > 1e-5 && n<=nmax
    y = x - polyval(pc,x)/polyval(dpc,x); %Iterative Newton step
    xvals = [xvals;y];                   %Appending next iteration
    error = abs(y-x);
    x = y;
    n=n+1;
end
disp(['c) The final value using Newtons method is ' num2str(x) ' which is found after ' num2str(n) ' steps.'])

%d) Secant method for x0 = 1 and x1 = 2
x = [1;2];      %Starting values
nmax = 25;      %Maximum number of iterations
error = 1;        %Error bound
xvals = x;      %Iterations of x
n = 0;
while error > 1e-5 && n<=nmax
    s = (polyval(pc,xvals(n+2))-polyval(pc,xvals(n+1)))/(xvals(n+2)-xvals(n+1)); %Secant 
    y = xvals(n+2)-polyval(pc,xvals(n+2))/s;   %Iterative secant step
    error = abs(y-xvals(n+2));    
    xvals = [xvals;y];                         %Appending next iteration
    n=n+1;
end
disp(['d) The final value using the secant method is ' num2str(xvals(n+2)) ' which is found after ' num2str(n) ' steps.'])

%e) Bisection method on the interval [1,2]

% Since the first step will reduce the interval to [1,1.5], which only
% contains one root, it will then converge to this root, namely x =
% 1.4706... = 25/17

%f) Description of fzerotx(p,[1,2])
%The initial secant step is x = 1.69, which is near the root 25/15. fzerotx
%then takes 10 steps, 7 with IQI, to converge to 25/15. The interval [a,b]
%always includes all three roots.
rootfzero = fzerotx(@polyexercise43,[1,2]);
disp(['f) The final value using fzerotx is ' num2str(rootfzero)])

