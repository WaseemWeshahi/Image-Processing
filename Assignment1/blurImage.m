function nim = blurImage(im,blurLevel)
% Blurs given image at a given blur level.
% Input: im = gray scale image
%          blurLevel - value in [1..100] where 1 = no blur and 100 max blur
% Output: nim - grayscale image same size as im
%
ker = ones(blurLevel,blurLevel)./(blurLevel.^2);
nim = conv2_cyclic(im,ker);
%nim = filter2(ker,im,'same');


function c = conv2_cyclic(a,b);
% convolve a and b using cyclic padding. 
% return imag c same size as a
% assume b <= a
aa = [ a a a ; a a a ; a a a];
c = conv2(aa,b,'same');
c = c(size(a,1)+1:2*size(a,1),size(a,2)+1:2*size(a,2));