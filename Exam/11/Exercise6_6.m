for x = .1:.1:1
    E = 2/sqrt(pi)*quadtx(@(x)exp(-x.^2),0,x);
    err = E - erf(x);
    disp(sprintf('%1.1f %10.4e', x,err))
end

%Errors are less than 10^-8 or better with default tolerance