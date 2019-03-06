
unsorted_result = dlmread('fritchman_compiled.txt'); %%REPLACE IT BY THE NAME OF OUTPUT FILE
[~,idx] = sort(unsorted_result(:,1)); % sort just the first column
result = unsorted_result(idx,:);
figure('units','normalized','outerposition',[0 0 1 1])
%hold on
eps = result(:,1);
mds = result(:,10);
const_c = result(:,9);
mt = result(:,8);
fo_kh = result(:,7);
const_a = result(:,6);
uncoded = result(:,5);
th_uncoded = result(:,11);
%semilogy(eps,result(:,5),'-*r',eps,result(:,11),'-.c',eps,result(:,6),'-sg',eps,result(:,7),'-ob',eps,result(:,8),'-.m',eps,result(:,9),'-sc',eps,result(:,10),'--dk')
semilogy(eps,mds,eps,mt,eps,fo_kh,eps,const_a,eps,const_c); 
grid on
legend({'MDS','Martinian-Trott','Fong et al.','Construction A','Construction C'},'Orientation','horizontal','Location','northoutside','FontSize',16)
%legend({'Uncoded','Theoretical Uncoded','Construction A','Fong Khishti','Martinian-Trott','Construction C', 'MDS'},'Orientation','horizontal','Location','northoutside','FontSize',16)
xlabel('Epsilon')
ylabel('Packet Loss Rate')
set(gcf,'Units','Inches');
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

%MDS MT FONG A C 