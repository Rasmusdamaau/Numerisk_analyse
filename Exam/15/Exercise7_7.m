%Exercise 7.7
%y1' = cos(t), y1(0)=0
%y2' = sqrt(1-y^2), y2(0)=0
%y3'' = -y, y3(0)=0, y3'(0)=1
%y4'' = -sin(t), y4(0)=0, y4'(0)=1

%(a) What is the common solution?
%y(t) = sin(t), 0 <= t <= pi/2

%(b) Rewrite as first-order systems.
%y'' = -y; y1 = y, y2 = y'; y1' = y' = y2, y2' = y'' = -y1

%y'' = -sin(t); y1 = y, y2 = y'; y1' = y' = y2, y2' = y'' = -sin(t)

%(c) What is the Jacobian for each problem?
%J1 = 0
%J2 = -2y/(sqrt(1-y^2))
%J3 = [0 1; -1 0]
%J4 = [0 1; 0 0]

%(d) How much work does ode45 require to solve each problem?
tic
[t1,y1]=ode45(@(t,y) cos(t),[0 pi/2], 0,odeset('RelTol',1e-9,'AbsTol',1e-9,'Stats','on'));
toc


tic
[t2,y2]=ode45(@(t,y) sqrt(1.-y^2),[0 pi/2], 0,odeset('RelTol',1e-9,'AbsTol',1e-9,'Stats','on'));
toc

tic
[t3,y3]=ode45(@(t,y) [y(2);-y(1)],[0 pi/2], [0 1],odeset('RelTol',1e-9,'AbsTol',1e-9,'Stats','on'));
toc

tic
[t4,y4]=ode45(@(t,y) [y(2);-sin(t)],[0 pi/2], [0 1],odeset('RelTol',1e-9,'AbsTol',1e-9,'Stats','on'));
toc

%Note that for the second problem, the Jacobian J2 becomes infinite as t -> pi/2 and
%y -> 1.

%%
%(e) What happens if we change the interval to 0 <= t <= pi?
tic
[t1,y1]=ode45(@(t,y) cos(t),[0 pi], 0,odeset('RelTol',1e-9,'AbsTol',1e-9,'Stats','on'));
toc


tic
[t2,y2]=ode45(@(t,y) sqrt(1.-y^2),[0 pi], 0,odeset('RelTol',1e-9,'AbsTol',1e-9,'Stats','on'));
toc

tic
[t3,y3]=ode45(@(t,y) [y(2);-y(1)],[0 pi], [0 1],odeset('RelTol',1e-9,'AbsTol',1e-9,'Stats','on'));
toc

tic
[t4,y4]=ode45(@(t,y) [y(2);-sin(t)],[0 pi], [0 1],odeset('RelTol',1e-9,'AbsTol',1e-9,'Stats','on'));
toc

%Note that y2' is never negative, so the solution cannot decrease. At
%t=pi/2 the theoretical solution is no longer unique. As t approaches pi/2
%, y becomes slightly larger than 1, sqrt(1-y^2) becomes complex, and ode45
%has to take impossibly small steps. 

%%
%(f) What happens to the second problem if it is changed to y' =
%sqrt(abs(1-y^2)), y(0)=0 (still with 0 <= t <= pi)
tic
[t2,y2]=ode45(@(t,y) sqrt(abs(1.-y^2)),[0 pi], 0,odeset('RelTol',1e-9,'AbsTol',1e-9,'Stats','on'));
toc

%For t > pi/2 and y > 1, the equation becomes y' = sqrt(y^2-1), y(pi/2)=1.
%The solution becomes y(t) = cosh(t-pi/2).


