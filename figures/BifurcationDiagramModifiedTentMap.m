clear;
clc;
close all;

x0 = 0.321;

N = 1500;

Transient = 750;

mu = 1:0.0005:2;

k = 0.05;

figure('Color','w');

hold on;

for j = 1:length(mu)

    x = x0;

    % Remove transient
    for i = 1:Transient

        x = TentModified(x,mu(j),k);

    end

    for i = 1:(N-Transient)

        x = TentModified(x,mu(j),k);

        plot(mu(j),x,'.k','MarkerSize',1);

    end

end

xlabel('\mu','FontSize',12,'FontWeight','bold');

ylabel('State Variable x_n','FontSize',12,'FontWeight','bold');

axis([1 2 0 1]);

box on;

grid on;

set(gca,'FontSize',11);

print(gcf,'Bifurcation_Diagram_Modified_Tent_Map','-dpng','-r300');
