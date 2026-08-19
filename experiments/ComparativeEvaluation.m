clear;
clc;
close all;

addpath('../src/analysis');

N = 50000;

InitialConditions = linspace(0.01,0.99,100);

Threshold = 1000;

k = 0.05;

Result = zeros(4,4);

for Precision = 1:2

    if Precision==1

        disp(' ');
        disp('========================================');
        disp(' SINGLE PRECISION');
        disp('========================================');

        mu = single(1.99);
        k0 = single(k);

    else

        disp(' ');
        disp('========================================');
        disp(' DOUBLE PRECISION');
        disp('========================================');

        mu = 1.99;
        k0 = k;

    end

    CycleClassical = zeros(1,length(InitialConditions));

    CycleModified = zeros(1,length(InitialConditions));

    for n=1:length(InitialConditions)

        x=zeros(1,N);

        if Precision==1
            x=single(x);
            x(1)=single(InitialConditions(n));
        else
            x(1)=InitialConditions(n);
        end

        for i=2:N

            if x(i-1)<0.5
                x(i)=mu*x(i-1);
            else
                x(i)=mu*(1-x(i-1));
            end

        end

        [T,C]=CycleStatistics(double(x));

        CycleClassical(n)=C;

    end

    for n=1:length(InitialConditions)

        x=zeros(1,N);

        if Precision==1
            x=single(x);
            x(1)=single(InitialConditions(n));
        else
            x(1)=InitialConditions(n);
        end

        for i=2:N

            x(i)=TentModified(double(x(i-1)),double(mu),double(k0));

            if Precision==1
                x(i)=single(x(i));
            end

        end

        [T,C]=CycleStatistics(double(x));

        CycleModified(n)=C;

    end

    MeanC=mean(CycleClassical);
    MinC=min(CycleClassical);
    MaxC=max(CycleClassical);
    RateC=100*sum(CycleClassical<Threshold)/length(CycleClassical);

    MeanM=mean(CycleModified);
    MinM=min(CycleModified);
    MaxM=max(CycleModified);
    RateM=100*sum(CycleModified<Threshold)/length(CycleModified);

fprintf('\n');
fprintf('Classical Tent Map\n');
fprintf('Mean Cycle = %.2f\n',MeanC);
fprintf('Minimum    = %d\n',MinC);
fprintf('Maximum    = %d\n',MaxC);
fprintf('Short Rate = %.2f %%\n',RateC);

fprintf('\n');
fprintf('Modified Tent Map\n');
fprintf('Mean Cycle = %.2f\n',MeanM);
fprintf('Minimum    = %d\n',MinM);
fprintf('Maximum    = %d\n',MaxM);
fprintf('Short Rate = %.2f %%\n',RateM);

    if Precision==1

        Result(1,:)=[MeanC MinC MaxC RateC];
        Result(2,:)=[MeanM MinM MaxM RateM];

    else

        Result(3,:)=[MeanC MinC MaxC RateC];
        Result(4,:)=[MeanM MinM MaxM RateM];

    end

end

disp(' ');
disp('==============================================================');
disp('FINAL COMPARISON TABLE');
disp('==============================================================');

fprintf('%-25s %-10s %-10s %-10s %-10s %-10s\n',...
'Map','Precision','Mean','Min','Max','Short %');

fprintf('%-25s %-10s %10.2f %10d %10d %10.2f\n',...
'Classical Tent','Single',Result(1,1),Result(1,2),Result(1,3),Result(1,4));

fprintf('%-25s %-10s %10.2f %10d %10d %10.2f\n',...
'Modified Tent','Single',Result(2,1),Result(2,2),Result(2,3),Result(2,4));

fprintf('%-25s %-10s %10.2f %10d %10d %10.2f\n',...
'Classical Tent','Double',Result(3,1),Result(3,2),Result(3,3),Result(3,4));

fprintf('%-25s %-10s %10.2f %10d %10d %10.2f\n',...
'Modified Tent','Double',Result(4,1),Result(4,2),Result(4,3),Result(4,4));
