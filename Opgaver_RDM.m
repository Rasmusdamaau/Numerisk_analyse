% %opg. 1.34:
% t = 0.1;
% n = 1:10;
% e = n/10 - n*t;
% eny = n/10 - n*t + 1;
% e < eps;
% eny < eps +1;

% %opg. 1.35:
%x = 1; while 1+x > 1, x = x/2, end;
%x = 1; while x+x > x, x = 2*x, end;
%x = 1; while x+x > x, x = x/2, end;

% %opg. 1.38:


% a = 1;
% b = -100000000;
% c = 1;

% myroots_p = (-b + sqrt(b^2 - 4*a*c))/(2*a)
% myroots_m = (-b - sqrt(b^2 - 4*a*c))/(2*a)
% roots([a b c]);

% % x_1*x_2=c/a
% 1/100000000


% % opg. 1.39:

% x = pi/2
% si = powersin(x)

% function s = powersin(x)
% % POWERSIN. Power series for sin(x).
% % POWERSIN(x) tries to compute sin(x)
% % from a power series
% s = 0;
% t = x;
% n = 1;
% while s+t ~= s;
% s = s + t;
% t = -x.^2/((n+1)*(n+2)).*t;
% n = n + 2;
% end
% end


% Lek 2:

% A = [0 1 3 ; 2 5 1 ; 1 1 1];
% A = [4 3 7 ; -4 -1 -3 ; 2 1 2]

% [L, U, P] = lu(A)

% Lek 3:

% opg 2.9
% A = [ 1 2 3 ; 4 5 6 ; 7 8 9 ];
% b = [1 3 5]';

% A\b;

% opg. 2.6
% n = 1;
% A = 2*eye(n) + -tril(ones(n));
% while cond(A,1) <= 1/eps 
%     A = 2*eye(n) + -tril(ones(n));
%     n * 2^(n-1);
%     cond(A,1);
%         
%     n = n+1
% end



% unif_fordel = 100;
% n = 48;
% A = 2*eye(n) + -tril(ones(n));
% x = -unif_fordel + (unif_fordel+unif_fordel)*rand([n 1]);
% while norm(A*x) >= norm(x) 
%     
%     x = -unif_fordel + (unif_fordel+unif_fordel)*rand([n 1]);
%     norm(A*x)
%     norm(x)
% 
% end


% Lek 4

% opg. 2
% N = 50;
% 
% x = cos((1:N)*pi/N);
% y = 1./(1 + 25*x.^2);
% 
% interpgui(x,y);
% polynomial works well


% opg. 4
% 
% n = 100;
% over = diag(repmat(-1,1,n-1),1);
% diago = diag(repmat(2,1,n),0);
% under = diag(repmat(-1,1,n-1),-1);
% b = (1:n)';
% 
% mat = over + diago + under;
% % a
% mat\b;
% x = bslashtx(mat,b);
% % b
% e = ones(n,1);
% A = spdiags([-e 2*e -e],-1:1,n,n);
% 
% A\b;
% 
% % c
% tridisolve(-e,2*e,-e,b);
% 
% 
% condest(A)

% opg. 5

% Lek 5

% opg. 2
% x = -1:1/3:1;
% interpgui(1-x.^2)

% interpgui(1-x.^4)

% interpgui(5)

% opg. 4

% x3 − 2x − 5 [0, 3]
% sin x [1, 4]
% x3 − 0.001 [−1, 1]
% log (x + 2/3) [0, 1]
% sign(x − 2)
% √
% |x − 2| [1, 4]
% atan(x) − π/3 [0, 5]
% 1/(x − π) [0, 5]
% F = @(x) x^3 - 2*x - 5;
% fzerogui(F, [0,3])



% lek 6
% opg 6.1

% quadgui(@(t) t.^(25).*(1-t).^(2),0,1,1.e-8)
% quadgui(@(t) t.^(8/3).*(1-t).^(10/3),0,1,1.e-8)
% quadgui(@(x) 1./(3.*x-1),0,1,1.e-4)


% lek 7
% 
% func_name = 'fcn4';
% % func_sol = pi;
% % func_sol = 1 - cos(4);
% % func_sol = (1/2) - (1/2) * cos(4);
% func_sol = 2 - cos(sqrt(3)) - cos(4)*cos(sqrt(3)) - sin(4)*sin(sqrt(3));
% 
% 
% N=1; 
% L=20;
% b=zeros(L,1);
% e=zeros(L-1,1);
% A=zeros(L,3);
% exfcn1 = func_sol;
% for k=1:L
%     b(k,1)=abs(exfcn1-trapN(func_name,0,1,N));
%     N=2*N; 
% end%
% for k=1:L-1
%     e(k,1)=abs(b(k,1)/b(k+1,1));
% end
% A(:,1)=2.^(0:L-1);
% A(:,2)=b(:,1);
% A(2:L,3)=e(:,1);
% 
% fprintf('trapez\n')
% fprintf('%6s %10s %8s\n', 'steps', 'error', 'ratio')
% fprintf('%6d %12.11f %6.4f\n', A')
% 
% % script til at lave fejlvurdering i 
% % trapezoide-formlen
% % format short
% N=1; 
% L=20;
% b=zeros(L,1);
% e=zeros(L-1,1);
% A=zeros(L,3);
% exfcn1 = func_sol;
% for k=1:L
%     b(k,1)=abs(exfcn1-midpointN(func_name,0,4,N));
%     N=2*N; 
% end%
% for k=1:L-1
%     e(k,1)=abs(b(k,1)/b(k+1,1));
% end
% A(:,1)=2.^(0:L-1);
% A(:,2)=b(:,1);
% A(2:L,3)=e(:,1);
% 
% fprintf('midpoint\n')
% fprintf('%6s %10s %8s\n', 'steps', 'error', 'ratio')
% fprintf('%6d %12.11f %6.4f\n', A')
% 
% N=1; 
% L=20;
% b=zeros(L,1);
% e=zeros(L-1,1);
% A=zeros(L,3);
% exfcn1 = func_sol;
% for k=1:L
%     b(k,1)=abs(exfcn1-simpsonN(func_name,0,4,N));
%     N=2*N; 
% end%
% for k=1:L-1
%     e(k,1)=abs(b(k,1)/b(k+1,1));
% end
% A(:,1)=2.^(0:L-1);
% A(:,2)=b(:,1);
% A(2:L,3)=e(:,1);
% 
% fprintf('simpson\n')
% fprintf('%6s %10s %8s\n', 'steps', 'error', 'ratio')
% fprintf('%6d %12.11f %6.4f\n', A')
% 
% function y = fcn4( x )
% %
% 
% y = sin(abs(x - sqrt(3)));
% 
% end
% 
% 
% function y = fcn3( x )
% %
% 
% y = x .* sin(x.^2);
% 
% end
% 
% function y = fcn2( x )
% %
% 
% y = sin(x);
% 
% end
% 
% function SN=simpsonN(fcn,a,b,N)
% % beregning af midpoint med N inddelinger
% h=(b-a)/N;
% x=a+(1:N-1)*h;
% M=h*((feval(fcn,(a + b)/2))+sum(feval(fcn,x)));
% T = h*((feval(fcn,a)+feval(fcn,b))/2+sum(feval(fcn,x)));
% SN = (2/3) * M + (1/3) * T;
% end
% 
% 
% function TN=midpointN(fcn,a,b,N)
% % beregning af midpoint med N inddelinger
% h=(b-a)/N;
% x=a+(1:N-1)*h;
% TN=h*((feval(fcn,(a + b)/2))+sum(feval(fcn,x)));
% end
% 
% function TN=trapN(fcn,a,b,N)
% % beregning af trapzoidereglen med N inddelinger
% % NB! fcn skal acceptere vektorinput
% % NB! NB! ingen fejlcheck i funktionen.
% % Arne Jensen, 23. marts 2003
% h=(b-a)/N;
% x=a+(1:N-1)*h;
% TN=h*((feval(fcn,a)+feval(fcn,b))/2+sum(feval(fcn,x)));
% end
% 
% function y = fcn1( x )
% %
% 
% y = 4./(1 + x.^2);
% 
% end

% Lek. 8 
tspan = [0 2*pi];
y0 = [1 0]';
F = @(t,y) [0 1; -1 0]*y;
[tout, yout] = ode23tx(F,tspan,y0);




    