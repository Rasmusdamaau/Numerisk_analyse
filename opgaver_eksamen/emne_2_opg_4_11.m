%% opg. 4.11

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

