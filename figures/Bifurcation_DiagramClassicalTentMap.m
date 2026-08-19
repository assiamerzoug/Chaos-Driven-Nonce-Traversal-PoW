clear;
clc;
close all;

x0 = 0.321;          % Initial condition

N = 1500;            % Total iterations

Transient = 750;    % Remove transient iterations

mu = 1:0.0005:2;     % Control parameter

figure('Color','w');

hold on;

for j = 1:length(mu)

    x = x0;

    % Remove transient
    for i = 1:Transient

        if x < 0.5
            x = mu(j)*x;
        else
            x = mu(j)*(1-x);
        end

    end

    % Plot bifurcation points
    for i = 1:(N-Transient)

        if x < 0.5
            x = mu(j)*x;
        else
            x = mu(j)*(1-x);
        end

        plot(mu(j),x,'.k','MarkerSize',1);

    end

end

xlabel('\mu','FontSize',12,'FontWeight','bold');

ylabel('State Variable x_n','FontSize',12,'FontWeight','bold');

%%title('Bifurcation Diagram of the Classical Tent Map',...
     %% 'FontSize',13,'FontWeight','bold');

axis([1 2 0 1]);

box on;

grid on;

set(gca,'FontSize',11);

print(gcf,'Bifurcation_Diagram_Classical_Tent_Map','-dpng','-r300');
