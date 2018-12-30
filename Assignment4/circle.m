function mask = circle(size,r)
% INPUT: mask's size and radius of the circle to draw in this mask
 [x,y] = meshgrid([1:size(2)],[1:size(1)]);
 dist = (x-size(2)/2).^2+(y-size(1)/2).^2;
 mask = dist;
 mask((dist>r^2)) = 255;
 mask((dist<=r^2))=0;
  mask = cleanImageMean(mask,[7 7],8);

end
 