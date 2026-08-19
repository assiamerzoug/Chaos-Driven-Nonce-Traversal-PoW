clc;
clear;
close all;

mu = 1.99;
N = 100000;          % Number of iterations
Ntrans = 1000;       % Remove transient
x0 = 0.34789;

x_classical = zeros(1,N);
x_modified  = zeros(1,N);

x_classical(1) = x0;
x_modified(1)  = x0;

for n = 1:N-1

    if x_classical(n) < 0.5
        x_classical(n+1) = mu*x_classical(n);
    else
        x_classical(n+1) = mu*(1-x_classical(n));
    end

end

k = 0.05;      % Example value

for n = 1:N-1

    if x_modified(n) < 0.5
        x_modified(n+1) = mod(mu*(x_modified(n)+k),1);
    else
        x_modified(n+1) = mod((mu*(1-x_modified(n))+k),1);
    end

end

x_classical = x_classical(Ntrans+1:end);
x_modified  = x_modified(Ntrans+1:end);

Nbins = 50;

figure;

subplot(1,2,1)

[counts,centers] = hist(x_classical,Nbins);

bar(centers,counts,'b');

xlabel('State x','FontSize',12)
ylabel('Frequency','FontSize',12)
%%title('(a) Classical Tent Map','FontSize',13)

xlim([0 1])
grid on

subplot(1,2,2)

[counts,centers] = hist(x_modified,Nbins);

bar(centers,counts,'b');

xlabel('State x','FontSize',12)
ylabel('Frequency','FontSize',12)
%%title('(b) Proposed Modified Tent Map','FontSize',13)

print(gcf,'Histogram_comparative','-dpng','-r300');
xlim([0 1])
grid on
