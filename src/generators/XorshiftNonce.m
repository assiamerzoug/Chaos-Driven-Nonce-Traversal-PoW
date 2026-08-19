function [Nonce,State] = XorshiftNonce(State)

if isempty(State)

    State = uint32(2463534242);

end

x = State;

x = bitxor(x, bitshift(x,13));

x = bitxor(x, bitshift(x,-17));

x = bitxor(x, bitshift(x,5));

State = x;

Nonce = x;
