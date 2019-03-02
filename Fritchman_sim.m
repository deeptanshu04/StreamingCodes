function [erasure, out_state] = Fritchman_sim(eps,alpha,beta,M,in_state)
%One good state G (denoted by 0 in the code), M bad states E1...EM.
%(denoted by 1..M in the code). 

rn = rand(1,2); 
out_state = in_state;
erasure =0;
if (in_state ==0) %Good State
    if (rn(1)<=alpha)
        out_state = 1; 
    end
    if (rn(2)<=eps)
        erasure =1;
    end
    
elseif ((in_state>0)&&(in_state<M))
    if (rn(1)<=beta)
        out_state = in_state+1; 
    end
    erasure = 1; 
       
elseif (in_state==M)
    if (rn(1)<=beta)
        out_state = 0; 
    end
    erasure = 1;
    
end
end