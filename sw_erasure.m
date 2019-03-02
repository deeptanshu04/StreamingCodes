function vep = sw_erasure(ep,t,b,a)
del = b-a;
k = t+1-a;
n = t+1+del;
vep  = 1;
for i = 1:k
    ul = min(t+i,n);   
    ep_i = ep(k-i+1:k-i+ul);
    random_err = sum(ep_i);
    burst_err = range(find(ep_i))+1;
    valid = (random_err<=a) || (burst_err<=b);
    vep = vep & valid;
    
    if(vep==0)
        break;
    end    
end
end
