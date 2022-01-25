
% Explain the output produced by
% t = 0.1
% n = 1:10
% e = n/10 - n*t

%opg. 1.34:
t = 0.1;
n = 1:10;
n/10
n*t
e = n/10 - n*t
eny = n/10 - n*t + 1;
abs(e) < eps

e / eps

abs(e) < realmin

%%
n*t == 0.3
n/10 == 0.3
n*t - eps/4 == 0.3 

%%
n*t == 0.6
n/10 == 0.6
n*t - eps/2 == 0.6

%%
n*t == 0.7
n/10 == 0.7