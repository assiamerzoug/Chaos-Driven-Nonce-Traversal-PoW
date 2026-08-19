function Header = CreateBlockHeader(Nonce,RunID)

Version = uint8([1 0 0 0]);

Seed1 = uint8(mod(RunID,256));

PrevHash = SHA256Hash(Seed1);

Seed2 = uint8(mod(RunID+100,256));

MerkleRoot = SHA256Hash(Seed2);

Timestamp = uint8([0 0 0 0]);

Bits = uint8([0 0 0 0]);

NonceBytes = typecast(uint32(Nonce),'uint8');

NonceBytes = NonceBytes(:);

Header = [Version(:)
          PrevHash(:)
          MerkleRoot(:)
          Timestamp(:)
          Bits(:)
          NonceBytes(:)];
