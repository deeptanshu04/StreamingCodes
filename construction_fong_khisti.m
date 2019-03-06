function [G_fk] = construction_fong_khisti(t,b,a)
% only for k >= b i.e. codes with rate half- or more
%t=11;b=8; a=4;
rng(10)

del = b-a;
k = t+1-a;
n = t+1+del; 

temp1 = 2*(nchoosek(t+1,a) +t-b+2);
m = ceil(log2(temp1))
I_mat = gf(eye(k),m); 

P = gf(zeros(k,b),m);
valid_streaming_code = 0;
counter = 0;
while(~valid_streaming_code)
    counter = counter+1; 
    fprintf('TRIAL %d\n',counter)
    for i = 1:del
        P(i,i:(i+a-1)) = gf(randi([0,2^m-1],1,a),m);
    end
    P(del+1:b,del+1:b) = gf(randi([0,2^m-1],a,a),m);
    if (k>b) %Add a Cauchy Matrix
        x = gf(1:k-b,m);
        y = gf(k-b+1:k,m);
        
        for i = 1:(k-b)
            for j = 1:b
                P(b+i,j) = (x(i)-y(j))^-1;
            end
        end
    end
    G_fk = [I_mat P];
    valid_streaming_code = check_valid_streaming(G_fk,t,b,a,0);
    
end
end
