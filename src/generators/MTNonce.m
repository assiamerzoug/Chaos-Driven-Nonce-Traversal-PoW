function [Nonce,State] = MTNonce(State)

Nonce = uint32(floor(rand*2^32));

State = [];

end
