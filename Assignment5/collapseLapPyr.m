function img = collapseLapPyr(L)
levels = length(L);
prev = L{levels};
for i=levels-1:-1:1
    prev = L{i}+upSample(prev);
end
img = prev;
end