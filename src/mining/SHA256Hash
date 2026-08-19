function hash = SHA256Hash(data)

if ischar(data)

    data = uint8(data);

elseif isa(data,'uint8')

    % already uint8

else

    data = uint8(data);

end

md = java.security.MessageDigest.getInstance('SHA-256');

md.update(data);

hash = typecast(md.digest,'uint8');
