%% opg. 6.4

for k = 1:15
   tolerance = 1/2^k;
   [Q,fcount] = quadtx(@(x)2./(1+x.^2),-1,1,tolerance);
   err = Q-pi;
   fprintf('%e  %e %d \n', ...
     tolerance,err,fcount)
end