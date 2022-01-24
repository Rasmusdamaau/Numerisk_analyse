k = 1000;
results = [];
for i = 1:k
   n = ceil(rand*nmax);
   A = randn(n,n);
   kappa = condest(A);
   results = [results; n kappa];
end
p = 3/2;
c1=0.5;
c2 = 5000;
x = linspace(0, max(results(:,1)),1000);
y1 = c1*x.^p;
y2 = c2*x.^p;
hold on
loglog(results(:,1),results(:,2),'.')
loglog(x,y1,x,y2)
hold off