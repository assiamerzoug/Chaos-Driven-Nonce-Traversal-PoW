clear;
clc;
close all;

Parameters.Difficulty = 8;

Parameters.MaxNonce = 1000000;

Runs = 100;

GeneratorName = {...
    'Sequential',...
    'MT19937',...
    'Xorshift32',...
    'Classical Tent',...
    'Modified Tent'};

GeneratorHandle = {...
    @SequentialNonce,...
    @MTNonce,...
    @XorshiftNonce,...
    @ClassicalTentNonce,...
    @ModifiedTentNonce};

Hashes = zeros(5,Runs);

MiningTime = zeros(5,Runs);

HashRate = zeros(5,Runs);

Duplicates = zeros(5,Runs);

Overhead = zeros(5,Runs);

for g = 1:5

    fprintf('\n%s\n',GeneratorName{g});

    for r = 1:Runs

        fprintf('Run %d/%d\n',r,Runs);

        Result = MinePoW(GeneratorHandle{g},Parameters,r);
        
        Hashes(g,r) = Result.HashesUntilSuccess;

        MiningTime(g,r) = Result.TotalTime;

        HashRate(g,r) = Result.HashRate;

        Overhead(g,r) = Result.GenerationOverhead;

        UniqueNonce = unique(Result.NonceSequence);

        Duplicates(g,r) = ...
            length(Result.NonceSequence)-length(UniqueNonce);

    end

end

MeanHashes = mean(Hashes,2);
StdHashes  = std(Hashes,0,2);

MeanTime = mean(MiningTime,2);
StdTime  = std(MiningTime,0,2);

MeanRate = mean(HashRate,2);
StdRate  = std(HashRate,0,2);

MeanDup = mean(Duplicates,2);
StdDup  = std(Duplicates,0,2);

MeanOver = mean(Overhead,2);
StdOver  = std(Overhead,0,2);

fprintf('\n');
fprintf('===============================================================================================\n');
fprintf('%-18s %-18s %-18s %-18s %-18s %-18s\n',...
'Generator',...
'Hashes',...
'Time(s)',...
'Hash Rate',...
'Duplicates',...
'Overhead(%%)');
fprintf('===============================================================================================\n');

for i=1:5

fprintf('%-18s %7.2f +- %-7.2f %7.4f +- %-7.4f %8.2f +- %-8.2f %6.2f +- %-6.2f %6.2f +- %-6.2f\n',...
GeneratorName{i},...
MeanHashes(i),StdHashes(i),...
MeanTime(i),StdTime(i),...
MeanRate(i),StdRate(i),...
MeanDup(i),StdDup(i),...
MeanOver(i),StdOver(i));

end

fprintf('===============================================================================================\n');

Data = Hashes';

[p,tbl,stats] = friedman(Data,1,'off');

fprintf('\n');
fprintf('=============================================\n');
fprintf(' Friedman Test\n');
fprintf('=============================================\n');

fprintf('p-value = %.6f\n',p);

if p > 0.05

    fprintf('\n');
    fprintf('No statistically significant difference\n');
    fprintf('between nonce traversal strategies.\n');

else

    fprintf('\n');
    fprintf('Statistically significant difference detected.\n');

end
