function ks = gen_k_sets(k,n)
% Generate all patterns of length n with k ones
if ((k==0)&& (n>0))
    ks = zeros(1,n);
elseif ((k==n) && (n>0))
    ks = ones(1,n);
elseif ((n<0)||(k<0))
    disp('NEGATIVE VALUE ENCOUNTERED')
    ks = [];
else
    t1 = gen_k_sets(k-1,n-1);
    [m1,n1] = size(t1);
    t2 = gen_k_sets(k,n-1);
    [m2,n2] = size(t2);
    ks1 = horzcat(ones(m1,1),t1);
    ks2 = horzcat(zeros(m2,1),t2);
    ks = vertcat(ks1,ks2);
end
end