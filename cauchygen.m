function[c]=cauchygen(a,b,m)  %a rows, b columns
if a+b>2^m
    error('Error: Need to increase m value');
else
    %rand_arr = randperm(2^m-1,a+b);
    F=gf(0:(a+b-1),m);
    y_i=F(1:a);
    x_i=F(a+1:a+b);
    c=gf(zeros(a,b),m);
    for i=1:a
        for j=1:b
            c(i,j)=(y_i(i)-x_i(j))^-1;
        end
    end
end
