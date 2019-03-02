function [erasure, out_state] = GE_sim(eps,alpha,beta,in_state)

% alpha - prob of leaving RE state. beta - prob of leaving BE state. 
erasure = 0;
out_state = in_state; 
rn = rand(1,2); 
if (in_state == 0) % Random erasure state
    if (rn(1)<eps)
        erasure =1 ;
    end
    
    if (rn(2)<alpha)
        out_state =1; 
    end
else                %Burst erasure state
    erasure =1; 
    if(rn(2)<beta)
        out_state = 0;
    end
end


end