function B = bilat(im,w,sigma_d,sigma_r)
% This function applies bilateral filter to the image
% INPUT: im - greyscale image
%        w  - maskRadius
%        sigma_d - sigma for directional weighting
%        sigma_r - sigma for color wrighting
% OUTPUT: B - Bilateraly filtered image
% compute Gaussian distance weights.
[X,Y] = meshgrid(-w:w,-w:w);
G = exp(-(X.^2+Y.^2)/(2*sigma_d^2));

% Apply bilateral filter.
dim = size(im);
B = zeros(dim);
for i = 1:dim(1)
   for j = 1:dim(2)
         % Extract local region.
         iMin = max(i-w,1);
         iMax = min(i+w,dim(1));
         jMin = max(j-w,1);
         jMax = min(j+w,dim(2));
         I = im(iMin:iMax,jMin:jMax);
      
         % Compute Gaussian intensity weights.
         H = exp(-(I-im(i,j)).^2/(2*sigma_r^2));
      
         % Calculate bilateral filter response.
         F = H.*G((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
         B(i,j) = sum(F(:).*I(:))/sum(F(:));
               
   end
end
