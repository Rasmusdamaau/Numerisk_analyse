% RANDNCOND  Condition of random matrices

%   Copyright 2014 Cleve Moler
%   Copyright 2014 The MathWorks, Inc.

nmax = 100;
n = 2:nmax;
kappalo = 0.5*n.^(3/2);
kappahi = 5000*n.^(3/2); %condest on rand(n,n) grows like n^(3/2)
results = [];

shg
clf reset
h = loglog(n,[kappalo; kappahi],'-',nmax,NaN,'.');
set(h(1:2),'color',[0 2/3 0]);
set(h(3),'color','blue')
set(gca,'xtick',[2:2:10 20:20:nmax])
kappamax = 1.e6;
axis([2 nmax 2 kappamax])
stop = uicontrol('pos',[20 10 40 25], ...
   'style','toggle','string','stop','value',0);
hold on

while get(stop,'value') ~= 1
   n = ceil(rand*nmax);
   A = randn(n,n);
   kappa = condest(A);
   results = [results; n kappa];
   loglog(n,kappa,'.','color','blue')
   drawnow
end
hold off

set(stop,'val',0,'string','close','callback','close(gcf)')
