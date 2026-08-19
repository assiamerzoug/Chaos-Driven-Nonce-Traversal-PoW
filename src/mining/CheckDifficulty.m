function success = CheckDifficulty(hash,DifficultyBits)

Bytes = floor(DifficultyBits/8);

Remain = rem(DifficultyBits,8);

success = 1;

for i=1:Bytes

    if hash(i)~=0

        success=0;
        return;

    end

end

if Remain>0

    value = hash(Bytes+1);

    if bitshift(value,-(8-Remain))~=0

        success=0;

    end

end
