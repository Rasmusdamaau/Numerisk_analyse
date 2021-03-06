function f = predprey(r0,f0,a)

options = odeset('AbsTol',1e-20);
[t,c] = ode45(@PP,[0 20],[r0,f0],options,a)
[pks,locs] = findpeaks(c(:,1));         %Finds peaks
mean_period = mean(diff((t([locs]))))   %Finds the period

subplot (2,1,1);
plot (c(:,1)',c(:,2)'); hold on;
legend ('trajectory');
xlabel ('prey'); ylabel ('predator');
subplot (2,1,2);
plot (t,c(:,1)','-',t,c(:,2)','--');
legend ('prey','predator');
xlabel ('time');

%---------------------- function ------------------------------------------

function dydt = PP(t,y,a)
dydt = zeros(2,1);
dydt(1) = y(1)*(2-a*y(2));
dydt(2) = y(2)*(-1+a*y(1));