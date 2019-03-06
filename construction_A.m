function [G,H] = construction_A(t,b,a)

%t=11;b=8; a=4;
rng(10);
m = ceil(log2(t+1)); 
del = b-a;
k = t+1-a;
n = t+1+del; 

%Generate F_q
poly = zeros(1,2^m+1);
poly([2,end]) = [1,1];
gfpoly = gf(poly,2*m);
F_q = [gf(0,2*m);roots(gfpoly)] % all non-zero elements of F_q roots of X^q = X. 
%disp('fq check')
%F_q.^(2^m-1)


l_q=length(F_q); % should be 2^q
non_fq = setdiff(1:2^(2*m)-1,F_q.x); %Select an element not from F_q. 

H= gf(zeros(b,n),2*m);

alpha = gf(non_fq(1),2*m);
H(1:del,1:del) = alpha*eye(del); 
H(del+1:b,1:a) = gf(1,2*m)*eye(a);
H(del+1,n) = gf(1,2*m);     

%Generate the Cauchy Matrix part
x = F_q(1:a);
y = F_q(a+1:t+1); 

for i = del+1:b
    for j = a+1:t+1
        H(i,j) = (x(i-del)-y(j-a))^-1;
    end
end


%Random assignment part
valid_assignment = 0;
counter = 0;
while (valid_assignment == 0)
    valid_assignment =1;
    counter = counter+1
    disp('STARTING OVER')
    rand_arr = randi(l_q,del,t-b+1); 
       
    for i = 1:del
        H(i,b+i:t+i) = F_q(rand_arr(i,:));
    end
    
    for l = (del+1):(k+1)
        P_l = H(1:b,l:(l+b-1));
        det_P_l = det(P_l);
        
        valid_assignment = valid_assignment & (det_P_l~= gf(0,2*m));
    end
end  

H_PI = H(:,n-b+1:n)^(-1)*H;
P = H_PI(:,1:n-b);
G = [eye(k)*gf(1,2*m) -P'];
end
