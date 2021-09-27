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

n = 100;
over = diag(repmat(-1,1,n-1),1);
diago = diag(repmat(2,1,n),0);
under = diag(repmat(-1,1,n-1),-1);
b = (1:n)';

mat = over + diago + under;

mat\b











    