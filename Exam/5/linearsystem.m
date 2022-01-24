n = 500; 
Q = orth(randn(n,n));   %returns orthonormal basis
d = logspace(0,-10,n);  %n points between 1 and 10^-10
A = Q*diag(d)*Q';       %condition number of 1e10, norm of 1
x = randn(n,1);         %random vector so we guarantee consistent system
b = A*x;                %

%Solving by inversion
tic
y = inv(A)*b;
t1 = toc;

err_inv = norm(y-x);  %absolute error
res_inv = norm(A*y-b); %residual error

%Solving by backslash operator
tic
z = A\b;
t2 = toc;

err_bs = norm(z-x);
res_bs = norm(A*z-b);

%We see that backslash is much faster, and much smaller residual
Inverse = [t1;err_inv; res_inv];
Backslash  = [t2;err_bs; res_bs];
table(Inverse,Backslash)