F = @(x) 2./(1+x.^2);
for k = 1:32
    tol = 1/(2^k);
    [Q,cnt] = quadtx(F,-1,1,tol);
    err = Q - pi;
    disp(sprintf('%10.2e %10.2e %d %7.3f %9.1f', tol,err,cnt,-log(tol)/cnt,tol/err))
end

%We see that the function evaluation count is 'proportional' to log(tol)

%We also see that the error is 'proportional' to the tolerance