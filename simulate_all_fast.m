function final_output = simulate_all_fast(alpha,beta,sim_length, eps)   

t=11;b=8; a=4;

del = b-a;
k = t+1-a;
n = t+1+del;
M=4; %Fritchman channel parameter
n_mds = 12; a_mds = 6; 

G = construction_A(t,b,a); %load('G_fk_11_8_4')
G_fk = construction_fong_khisti(t,b,a);
%For t=b, Martinian trott is just repetition
G_c = construction_c(t,b,a);

% MDS code
m_mds = 4; %Field size for MDS code
P = cauchygen(a_mds,a_mds,m_mds);
I_mat = gf(eye(a_mds),m_mds);
G_mds = [I_mat P];

error_array = zeros(1,6);
counter = 0;
ep = zeros(1,t+k);  % Erasure pattern. Need t values ahead, (k-1) values back.
ch_state = 0;       


while(counter<sim_length)
     counter = counter+1;
%UNCOMMENT THESE 2 LINES FOR GE CHANNEL     
%      [ep_next, ch_state_out] = GE_sim(eps,alpha,beta,ch_state);
%      th_uncoded =  (alpha+eps*beta)/(alpha+beta);
    [ep_next, ch_state_out] = Fritchman_sim(eps,alpha,beta,M,ch_state);
    [th_uncoded,~] = fritchman_uncoded_error(alpha,beta,M,eps);
    
    ch_state = ch_state_out;
    
    ep = circshift(ep,[0,-1]); 
    ep(end) = ep_next;
    
    
    %Decode an erased codeword
    if(ep(k)==1)    %if an erasure happens
        mt_success = (ep(k+t)==0); %Due to repetition coding
        
        if (sw_erasure(ep,t,b,a))  %If the erasure pattern is a valid sliding window one -- can always decode
            a_success =1;
            fo_kh_success =1;
            c_success =1;
        else
            a_success = decode_codeword(G,ep,n,k,t);
            fo_kh_success = decode_codeword(G_fk,ep,n,k,t);
            c_success = decode_codeword(G_c,ep,n,k,t);
        end
        
        if (sum(ep)<=a_mds)
            mds_success =1;
        else
            mds_success = decode_codeword_mds(G_mds,ep,n_mds,k,a_mds,t);
        end
        error_array = error_array+ ones(1,6) - [0, a_success, fo_kh_success,mt_success, c_success,mds_success];
    end
    
%         if (mod(counter,sim_length*0.1)==0)
%             fprintf('-eps=%f-%d%%--',eps,100*counter/sim_length)            
%         end
    
    
end
error_rates = error_array/counter;
final_output = [eps alpha beta sim_length error_rates th_uncoded];
end


function success = decode_codeword(G,ep,n,k,t)
success = 1;
for i = 1:k
    ul = min(t+i,n);
    ep_i = ep(k-i+1:k-i+ul);
    G_punctured = G(:,find(~ep_i));
    G_punctured_aug = [G_punctured G(:,i)];
    success = success & (rank(G_punctured)==rank(G_punctured_aug));
    
    if(success==0)
        break;
    end
    
end
end

function success = decode_codeword_mds(G_mds,ep,n_mds,k,a_mds,t)
success = 1;
for i = 1:a_mds
    ul = min(t+i,n_mds);
    ep_i = ep(k-i+1:k-i+ul);
    G_punctured = G_mds(:,find(~ep_i));
    G_punctured_aug = [G_punctured G_mds(:,i)];
    success = success & (rank(G_punctured)==rank(G_punctured_aug));
    
    if(success==0)
        break;
    end
end
end
