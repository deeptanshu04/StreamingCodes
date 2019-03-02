function [fue, steady_state]= fritchman_uncoded_error(alpha,beta,M,eps)
%alpha = 3e-5; beta = 0.6; eps = 0.015; M = 4;
tm = zeros(M+1,M+1); % transition matrix
tm(1,1) = 1-alpha;
tm(1,2) = alpha;

for i = 2:M
    tm(i,i) = 1-beta;
    tm(i,i+1) = beta;
end
tm(M+1,1) = beta;
tm(M+1,M+1)= 1-beta;

I = eye(M+1);
Y = null(tm'-I);
steady_state = Y./(sum(Y));
fue = steady_state(1)*eps+ sum(steady_state(2:end));

end