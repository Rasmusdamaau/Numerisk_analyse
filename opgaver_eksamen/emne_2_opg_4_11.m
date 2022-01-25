%% opg. 4.11

% What is the largest value of n for which
% Gamma(n + 1) and n! 
% can be exactly represented 
% by a double-precision floating-point number?

n = 1;
while abs(gamma(n + 1) - factorial(n)) == 0
    n = n +1;
end
n

%%
gamma(n + 1) - factorial(n)
gamma(n + 1)
factorial(n)
%%

% What is the largest value of n for which
% Gamma(n+1) and n! can be approximately
% represented by a double precision floating-point
% number that does not overflow?

n = 1;
while gamma(n + 1) ~= inf
    n = n + 1;
end
n

n = 1;
while factorial(n) ~=inf
    n = n + 1;
end
n

%%
gamma(n + 1 - 1)
factorial(n - 1)
realmax

