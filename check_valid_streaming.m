function success = check_valid_streaming(G,t,b,a,only_burst)
% Check if a given generator matrix is a valid streaming code
%clc
n = t + (b-a) + 1;
k = t - a + 1; 
ep1 = gen_k_sets(a,n);
ep2 = gen_burst_pattern(b,n); 
if (only_burst)
    ep = ep2;
    disp('CONFINED TO BURST ERASURE')
else
    ep = vertcat(ep1,ep2); %set of all erasue patterns
end
success =1; 
%Check for each coordinate
for i = 1:k 
    fprintf('Checking coordinate %d\n',i)
    tc = min(i+t,n);
    ep_i1 = find(ep(:,i));  %indices of all rows with i-th coordinate erased
    ep_i2 = ep(ep_i1,[1:tc]);    %all rows with i-th coordinate erased
    ep_i3 = unique(ep_i2,'rows');
     
    [m,~] = size(ep_i3);
    for j = 1:m
        ep_i = ep_i3(j,:);
        G_punctured = G(:,~ep_i);
        G_punctured_aug = [G_punctured G(:,i)];
        success = success & (rank(G_punctured)==rank(G_punctured_aug));
    
    if(success==0)
        fprintf('Decoding failed for cooridnate %d',i)
        disp(G_punctured_aug)
        break;
    end
    end

end

if (success ==1)
    disp('VALID STREAMING CODE')
else
    disp('NOT VALID ')
end
end