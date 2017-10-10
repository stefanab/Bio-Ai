function nhood = makeNhood(m)

m = 11;
nhood = ones(m,m);
for i= 1:m
    for j=1:m
        if (j > m-i+1)
            nhood(i,j) = 0;
        end
    end
end

end

