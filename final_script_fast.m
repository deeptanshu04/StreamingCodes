function result = final_script_fast(alpha,beta,sim_length) 
eps = linspace(0.01,0.1,6)  %Select the range of epsilon
l = length(eps);

no_rates = 6;
result = -1*ones(l,no_rates+5);

start_time = strcat('Fritchman_',datestr(now,'mm-dd_HH-MM'));
%start_time = stract('GE_',datestr(now,'mm-dd_HH-MM'));

mkdir(start_time);
Filename = strcat(start_time,'/result.txt');
tic

parfor i = 1:l %Replace by for if the system does not have multiple cores
    fprintf('\n Running Simulation for epsilon = %f\n',eps(i))
    result(i,:) =  simulate_all_fast(alpha,beta,sim_length,eps(i));
    dlmwrite(Filename,result(i,:),'delimiter','\t','-append');
end
toc

end