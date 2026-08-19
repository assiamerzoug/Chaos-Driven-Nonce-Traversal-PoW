function Result = MinePoW(Generator,Parameters,RunID)

Difficulty = Parameters.Difficulty;
MaxNonce   = Parameters.MaxNonce;

State = [];

NonceSequence = uint32(zeros(MaxNonce,1));

Hashes = 0;

GenerationTime = 0;

HashingTime = 0;

Found = 0;

while Hashes < MaxNonce

    t = tic;

    [Nonce,State] = feval(Generator,State);

    GenerationTime = GenerationTime + toc(t);

    Hashes = Hashes + 1;

    NonceSequence(Hashes) = uint32(Nonce);

    Header = CreateBlockHeader(Nonce,RunID);

    t = tic;

    Hash = DoubleSHA256(Header);

    HashingTime = HashingTime + toc(t);


    if CheckDifficulty(Hash,Difficulty)

        Found = 1;

        break;

    end

end


TotalTime = toc(TotalTimer);

NonceSequence = NonceSequence(1:Hashes);

Result.Success             = Found;

Result.HashesUntilSuccess  = Hashes;

Result.TotalTime           = TotalTime;

Result.HashRate            = Hashes/TotalTime;

Result.GenerationTime      = GenerationTime;

Result.HashingTime         = HashingTime;

Result.GenerationOverhead  = 100*GenerationTime/TotalTime;

Result.SuccessNonce        = Nonce;

Result.SuccessHash         = Hash;

Result.NonceSequence       = NonceSequence;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
