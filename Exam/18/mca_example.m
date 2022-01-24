%Initalise values
x0 = 1;
a = 13;
c = 0;
m = 31;

values = zeros(1,m); %For storing 'random' numbers

for i = 1:m
    values(i) = mca(x0,a,c,m);
    x0 = values(i);
end

values


%randgui(@randssp) approximates pi using IBM randu 1960

%randgui(@randmcg) approxiamtes pi using MATLABs old method with parameters
%a = 7^5
%c = 0
%m = 2^31 - 1

%randgui(@rand) approximates pi using Marsaglias algorithm