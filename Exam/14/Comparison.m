%Comparison of single-step methods
%y' = -100 y, y(0) = 1 ODE-IVP
y_true = @(t) exp(-100*t); %Analytical solution
h = 0.0001; %step size


x1 = 0:h:1; %interval [0:1]
n = numel(x1);

%Eulers Method
y1 = zeros(size(x1));
y1(1) = 1; %initial value
for i=1:n-1
    f = -100*y1(i); %Euler-step
    y1(i+1) = y1(i) + h*f;
end

%Midpoint Method
[x2,y2] = midpointmethod(@(t,y)(-100*y),1,[0 1],n-1);

%Trapezoidal method
[x3,y3] = trapezoidalODE(@(t,y)(-100*y),1,[0 1],n-1);


figure;
hold on
% subplot(1,2,1)
% plot(x1,y1)
% plot(x2,y2)
% plot(x3,y3)
% subplot(1,2,2)
plot(x1,-log(abs(y_true(x1)-y1)));
plot(x2,-log(abs(y_true(x1)-y2)));
plot(x3,-log(abs(y_true(x1)-y3)));
legend('Euler','Midpoint','Trapez')
hold off