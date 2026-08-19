function [Nonce,State] = ModifiedTentNonce(State)

if isempty(State)

    State = 0.123456789;

end

mu = 1.99;

k = 0.05;

if State < 0.5

    State = mod(mu*(State+k),1);

else

    State = mod(mu*(1-State+k),1);

end

Nonce = uint32(floor(State*2^32));
