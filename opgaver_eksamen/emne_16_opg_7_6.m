%y' = -100(y-sin t) + cos t, y(0) = 1 is mildly stiff on the interval [0 1]
syms y(t)
eqn = diff(y,t) == -100*(y-sin(t))+cos(t);
cond = y(0) == 1;
ySol(t) = dsolve(eqn,cond) %True solution

%Solving using ode23tx
opts = odeset('Stats','on');
tspan = [0 1];
y0 = 1;
F = @(t,y) -100*(y-sin(t))+cos(t);
tic, y1=ode23(F,tspan,y0,opts), toc %ode23 solver, 53 steps + 16 failed
tic, y2=ode23s(F,tspan,y0,opts), toc %ode23 stiff solver, 41 steps + 0 failed

%General plot
f1 = subplot(1,3,1);
hold on
f =ezplot(ySol(t),[0 1]);
set(f,'Color','black','Linewidth',0.5)
plot(y1.x,y1.y,'.','MarkerSize',10)
plot(y2.x,y2.y,'o','MarkerSize',5,'Color','b')
legend('true','non-stiff', 'stiff')
title('Interval [0:1]', 'FontSize', 12, 'fontweight', 'bold')
hold off

%Varying quickly: both solvers take small steps
f2 = subplot(1,3,2);
hold on
f =ezplot(ySol(t),[0.02 0.1]);
set(f,'Color','black','Linewidth',0.5)
plot(y1.x,y1.y,'.','MarkerSize',10)
plot(y2.x,y2.y,'o','MarkerSize',5,'Color','b')
legend('true','non-stiff', 'stiff')
title('Interval [0.02:0.1] - Varying quickly', 'FontSize', 12, 'fontweight', 'bold')
hold off

%Varying slow: stiff solver is taking longer steps
f3 = subplot(1,3,3);
hold on
f =ezplot(ySol(t),[0.4 0.55]);
set(f,'Color','black','Linewidth',0.5)
plot(y1.x,y1.y,'.','MarkerSize',10)
plot(y2.x,y2.y,'o','MarkerSize',5,'Color','b')
legend('true','non-stiff', 'stiff')
title('Interval [0.4:0.55] - Varying Slowly', 'FontSize', 12, 'fontweight', 'bold')
hold off