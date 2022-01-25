%% opg 7.15

%a) r0 = 300, f0 = 150, a = 0.01
predprey(300,150,0.01)
%%
%b) r0 = 15, f0 = 22, a = 0.01
predprey(15,22,0.01)
%%
%c) r0 = 102, f0 = 198, a = 0.01
predprey(102,198,0.01)

%% c) men med g stoppe funktion
ppp(102,198)

%%

function f = predprey(r0,f0,a)

options = odeset('AbsTol',1e-20);
[t,c] = ode45(@PP,[0 20],[r0,f0],options,a)


subplot (2,1,1);
plot (c(:,1)',c(:,2)'); hold on;
legend ('trajectory');
xlabel ('prey'); ylabel ('predator');
subplot (2,1,2);
plot (t,c(:,1)','-',t,c(:,2)','--');
legend ('prey','predator');
xlabel ('time');
end
%---------------------- function ------------------------------------------

function dydt = PP(t,y,a)
dydt = zeros(2,1);
dydt(1) = y(1)*(2-a*y(2));
dydt(2) = y(2)*(-1+a*y(1));
end

%%

function ppp(r0,f0)
% Periodic preditor prey

y0 = [r0; f0];
alpha = .01;
opts = odeset('reltol',1.e-6,'abstol',1.e-6, ...
   'refine',4,'events',@g);
[t,y,te,ye] = ode45(@f,[0 25],y0,opts,alpha,y0);
te
ye

shg
subplot(2,2,1)
plot(t,y)
xlabel(['tp = ' num2str(t(end))])

subplot(2,2,2)
plot(r0,f0,'o',y(:,1),y(:,2),'-')
xlabel('rabbits')
ylabel('foxes')
end
% ------------------------------------------

function ydot = f(t,y,alpha,y0)
ydot = [2*y(1)-alpha*y(1)*y(2)
         -y(2)+alpha*y(1)*y(2)];
end

% ------------------------------------------

function [gstop,isterm,dir] = g(t,y,alpha,y0)
ydot = f(t,y,alpha,y0);
d = (y-y0)./y;
gstop = d'*ydot;
isterm = 1;
dir = 1;
end
