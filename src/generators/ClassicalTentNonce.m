function [Nonce,State] = ClassicalTentNonce(State)

if isempty(State)

    State = 0.123456789;

end

mu = 1.99;

if State < 0.5

    State = mu*State;

else

    State = mu*(1-State);

end
Nonce = uint32(floor(State*2^32));
