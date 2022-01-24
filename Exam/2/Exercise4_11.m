i = 0; %For part a)
while gamma(i+1)-prod(1:i) == 0
    i = i+1;
end
disp(['Gamma and n! are exactly represented for n = ' num2str(i-1)])


n = 0; %For part b)
while gamma(n+1) ~= inf & prod(1:n) ~= inf
    n = n+1;
end
disp(['Gamma and n! does not overflow untill n = ' num2str(n)])