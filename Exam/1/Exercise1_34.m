t = 0.1; %Binary representation requires infinite series
n = 1:10;
e = n/10 - n*t;
n = transpose(n);
Error = transpose(e);
Factor = Error/eps;
tab = table(n,Error,Factor)