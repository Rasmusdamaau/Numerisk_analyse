function [tout,yout] = trapezoidalODE(f,y0,tspan,N)
% Simple implementation (without any error checks on the inputs), of
% the trapezoidal method for solving an ODE \dot{y} = f(t,y), for t in the
% interval tspan = [t0, tf], and with stepsize h = (tf-t0)/N.
%
% The output is tout = t0:h:tf, and if y0 is an M-vector then 
% yout is an M-by-(N+1) matrix.

t0 = tspan(1);
tf = tspan(2);
h = (tf-t0)/N;
y0 = y0(:); % make it a column vector
M = length(y0);
yout = zeros(M,N+1);
tout = linspace(t0,tf,N+1);
yout(:,1) = y0;

yn = y0;
for i = 1:N
    tn = tout(i);
    s1 = f(tn,yn);
    s2 = f(tn + h, yn + h*s1);
    yn = yn + h*(s1+s2)/2;
    yout(:,i+1) = yn;
end