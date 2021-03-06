% Lek. 10 


theta = 0.2;

z = [0; 0.05; 60*cos(theta); 60*sin(theta)];

dzdt = golf_ode(2,z);

dsol = golf_trajectory(pi/4);

y = golf_y(6,dsol);

T_theta = golf_zero(dsol);


curves = curvefinding(pi/9)


function dzdt = golf_ode(t,z)
A = -9.37 * 1.e-3;
B = -9.81;
z_1 = z(3);
z_2 = z(4);
z_3 = A * sqrt(z(3)^2 + z(4)^2) * z(3);
z_4 = A * sqrt(z(3)^2 + z(4)^2) * z(4) + B;

dzdt = [z_1; z_2; z_3; z_4];

end

function dsol = golf_trajectory(theta)

tspan = [0; 30];
z0 = [0; 0.05; 60*cos(theta); 60*sin(theta)];
dsol = ode45(@golf_ode,tspan,z0);

end

function y = golf_y(t, dsol)

y = deval(dsol, t);
y = y(2);

end

function T_theta = golf_zero(dsol)

T_theta = fzerotx(@golf_y, [0,30], dsol);

end

function curves = curvefinding(theta)

dsol = golf_trajectory(theta);
T_theta = golf_zero(dsol);
% t_vals = dsol.x(dsol.x<=T_theta);
% curve = deval(dsol,t_vals);
% X = curve(1,:);
% Y = curve(2,:);
X_lang = dsol.y(1,:);
X = X_lang(1:sum(dsol.x <= T_theta)+1);
Y_lang = dsol.y(2,:);
Y = Y_lang(1:sum(dsol.x <= T_theta)+1);

curves = {X, Y, T_theta};
plot(X,Y);


end
