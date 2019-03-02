function be = gen_burst_pattern(b,n)

be = [];
init = zeros(1,n);
init(1:b) = ones(1,b);
for i = 1:n
    be = vertcat(be,init);
    init = circshift(init,[0,1]);
end
end