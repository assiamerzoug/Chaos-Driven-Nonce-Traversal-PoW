function x_next = TentModified(x,mu,k)

if x < 0.5
    x_next = mod(mu*(x+k),1);
else
    x_next = mod(mu*(1-x+k),1);
end

end
