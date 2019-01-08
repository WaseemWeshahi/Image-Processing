function    L = laplacPyr(img,levels)
    L = cell(1,levels);
    G = gaussPyr(img,levels+1);
    
    for i = levels:1
        L{i} = G{i} - upSample(G{i+1});
    end

end