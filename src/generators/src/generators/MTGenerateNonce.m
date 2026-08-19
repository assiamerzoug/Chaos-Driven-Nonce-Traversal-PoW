function nonce = MTGenerateNonce(N,seed)

rand('twister',seed);

nonce = floor((2^32)*rand(N,1));

nonce = uint32(nonce);

end
