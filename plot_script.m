
unsorted_result = dlmread('fritchman_compiled.txt'); %%REPLACE IT BY THE NAME OF OUTPUT FILE
[~,idx] = sort(unsorted_result(:,1)); % sort just the first column
result = unsorted_result(idx,:);
figure('units','normalized','outerposition',[0 0 1 1])
%hold on
eps = result(:,1);
semilogy(eps,result(:,5),'-*r',eps,result(:,11),'-.c',eps,result(:,6),'-sg',eps,result(:,7),'-ob',eps,result(:,8),'-.m',eps,result(:,9),'-sc',eps,result(:,10),'--dk')
grid on
legend({'Uncoded','Theoretical Uncoded','Construction A','Fong Khishti','Martinian-Trott','Construction C', 'MDS'},'Orientation','horizontal','Location','northoutside','FontSize',16)
xlabel('Epsilon')
ylabel('Packet Loss Rate')
set(gcf,'Units','Inches');
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
