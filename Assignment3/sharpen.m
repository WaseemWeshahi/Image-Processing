function  sharpIm = sharpen(im, maskRadius, maskSTD, lambda)

%generating the delta mask, it has zeros all over its elements except for
%the origin

delta = zeros(maskRadius+3);
[width,height]=size(delta);
delta(round(width/2),round(height/2))=1;

% generating g, the blurring mask
g = zeros(maskRadius+3);
[m,n] = size(g);
[h1, h2] = meshgrid(-(m-1)/2:(m-1)/2, -(n-1)/2:(n-1)/2);
hg = exp(- (h1.^2+h2.^2) / (2*maskSTD^2));
g = hg ./ sum(hg(:));

% generating mask, by the function s(lambda) we used in class
mask = delta+lambda*(delta-g);

sharpIm= conv2(im,mask,'same');