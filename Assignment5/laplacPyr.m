function    L = laplacPyr(img,levels)
    L = cell(1,levels);
    G = gaussPyr(img,levels+1);
    L{levels} = G{levels};
    for i = levels-1:-1:1
        L{i} = G{i} - upSample(G{i+1});
    end

end