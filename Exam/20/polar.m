n = 500; %Number of points checked
accept = zeros(n,1);
values = [];
for i = 1:n
    u = 2*rand(2,1)-1; %Generates a point in [-1,1]x[-1,1]
    if u'*u > 1
        accept(i) = 0;
    else
        accept(i) = 1;
        values = [values, u];
    end
end

sum(accept)/n %Percentage of points we accept

%Transforms the values using v = sqrt(-2*log(r)/r)*u
normal = [];
for i = 1:size(values,2)
    normal = [normal, sqrt(-2*log(values(:,i)'*values(:,i))/ ...
                    (values(:,i)'*values(:,i)))*values(:,i)];
end
