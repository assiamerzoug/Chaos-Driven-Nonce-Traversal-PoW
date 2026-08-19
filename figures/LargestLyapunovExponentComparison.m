clear;
clc;
close all;


mu = 1:0.001:2;

LLE_Classical = zeros(size(mu));

LLE_Modified = zeros(size(mu));

for i=1:length(mu)

    LLE_Classical(i)=log(mu(i));

    LLE_Modified(i)=log(mu(i));

end

figure('Color','w');

plot(mu,LLE_Classical,'b','LineWidth',2);

hold on;

plot(mu,LLE_Modified,'r--','LineWidth',2);

xlabel('\mu','FontSize',12,'FontWeight','bold');

ylabel('Largest Lyapunov Exponent','FontSize',12,'FontWeight','bold');

title('Largest Lyapunov Exponent Comparison',...
      'FontSize',13,'FontWeight','bold');

legend('Classical Tent Map',...
       'Proposed Modified Tent Map',...
       'Location','NorthWest');

grid on;

box on;

set(gca,'FontSize',11);

print(gcf,'Largest_Lyapunov_Comparison','-dpng','-r300');
