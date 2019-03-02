function G_c = construction_c()
t=11;b=8; a=4;

%t = 7; b=6; a=2;
del = b-a;
k = t+1-a;
n = t+1+del; 

alpha_c = b/a;
beta_c = n/b;
m = ceil(log2(a*beta_c));

a*(beta_c-1);
P = cauchygen(a,a*(beta_c-1),m);
G_mds = [gf(eye(a),m) P];
G_c = gf(zeros(b,n),m);

for i = 1:beta_c
    for j = 1:alpha_c % alpha_c
        sp_y = (i-1)*b+ (j-1)*a+1;
        sp_x = (j-1)*a+1;
        G_c(sp_x:(sp_x+a-1),sp_y:(sp_y+a-1))= G_mds(1:a,(i-1)*a+1:i*a);
    end
end
        
end