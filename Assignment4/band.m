function mask = band(size,r,w)
    [x,y] = meshgrid([1:size(2)],[1:size(1)]);
    dist = (x-size(2)/2).^2+(y-size(1)/2).^2;
    dist = sqrt(dist);
    mask = ones(size);
    mask(dist<=r+w/2)=0;
    mask(dist<r-w/2)=1;
    mask = cleanImageMean(mask*255,[5 5],100);

end