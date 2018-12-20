function cleanIm = cleanImageMean (im, maskRadius, maskSTD)
mask = zeros(maskRadius+3);
[m,n] = size(mask);
% mask = fspecial('gaussian', size(mask),maskSTD);
[h1, h2] = meshgrid(-(m-1)/2:(m-1)/2, -(n-1)/2:(n-1)/2);
hg = exp(- (h1.^2+h2.^2) / (2*maskSTD^2));
mask = hg ./ sum(hg(:));

cleanIm = conv2(im,mask,'same');