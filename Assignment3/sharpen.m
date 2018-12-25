function  sharpIm = sharpen(im, maskRadius, maskSTD, lambda)
% This function applies sharpening using convolution.
% INPUT:    im - a grayscale image array in the range [0..255]. 
%           maskRadius – a 1x2 vector [numRows,numCols]. Defines neighborhood size
%           maskSTD  - he std of the Gaussian used to create the sharpening mask.
%           lambda – the strength of the sharpening to apply.
% OUTPUT:   cleanIm - grayscale image in the range [0..255] same size as im.
%           that is sharpened as learned in class.
% METHOD:   Create the sharpening mask S(lambda) as defined in class using the 
%           Gaussian parameters as the blur kernel.
%
% Written By:
% Waseem Weshahi    I.D: 206943391
% Bayan Farhan      I.D: 208300145

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