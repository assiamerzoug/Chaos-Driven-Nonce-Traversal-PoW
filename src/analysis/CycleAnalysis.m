function Result = CycleAnalysis(IsModified,Bits)

mu = 1.9999;

k = 0.05;

x = 0.314159265;

MaxIteration = 100000;

State = [];

Result.FirstRepeat = MaxIteration;

Result.CycleLength = 0;

for n=1:MaxIteration

    x = NextState(x,mu,k,IsModified);

    x = QuantizeState(x,Bits);

    Index = find(State==x,1);

    if isempty(Index)

        State(end+1)=x;

    else

        Result.FirstRepeat = n;

        Result.CycleLength = n-Index;

        return;

    end

end

Result.FirstRepeat = NaN;
Result.CycleLength = NaN;
end
