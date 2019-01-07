function    G = gaussPyr(img,levels)
G = cell(1,levels);
G{1}=img;
for i=2:levels
    G{i} = downSample(G{i-1});
end

end

    
