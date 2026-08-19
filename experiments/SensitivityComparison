clear;
clc;
close all;

mu=2;
k=0.05;

N=300;

x1=0.321;
x2=x1+1e-12;

XC1=zeros(1,N);
XC2=zeros(1,N);

a=x1;
b=x2;

for i=1:N

    if a<0.5
        a=mu*a;
    else
        a=mu*(1-a);
    end

    if b<0.5
        b=mu*b;
    else
        b=mu*(1-b);
    end

    XC1(i)=a;
    XC2(i)=b;

end

XM1=zeros(1,N);
XM2=zeros(1,N);

a=x1;
b=x2;

for i=1:N

    a=TentModified(a,mu,k);
    b=TentModified(b,mu,k);

    XM1(i)=a;
    XM2(i)=b;

end

figure('color','w');

subplot(2,1,1)

plot(XC1,'b','LineWidth',1.5)

hold on

plot(XC2,'r--','LineWidth',1.5)

%%title('Classical Tent Map')

ylabel('State')

legend('x_0','x_0+\delta')

grid on

subplot(2,1,2)

plot(XM1,'b','LineWidth',1.5)

hold on

plot(XM2,'r--','LineWidth',1.5)

%%title('Modified Tent Map')

xlabel('Iteration')

ylabel('State')

legend('x_0','x_0+\delta')

grid on

print(gcf,'Sensitivity_Comparison','-dpng','-r300');
