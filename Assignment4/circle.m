function mask = circle(size,r)
% INPUT: size - mask's size, a 1x2 vector
%        r - radius of the circle to draw in this mask
% OUTPUT: black circle in a white bg image, the same size as "size"
 [x,y] = meshgrid([1:size(2)],[1:size(1)]);
 dist = (x-size(2)/2).^2+(y-size(1)/2).^2;
 mask = dist;
 mask((dist>r^2)) = 0;
 mask((dist<=r^2))=255;
mask = cleanImageMean(mask,[4 4],10);

end
 